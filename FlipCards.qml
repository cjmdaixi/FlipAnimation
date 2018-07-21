import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: root

    property int segments: 4
    property Item flipContent
    property Item coverItem

    property int expandSpeed: 300
    property int foldSpeed: 300

    property bool expanding: false
    property bool folding: false

    property bool folded: true

    width: flipCardWidth
    height: flipCardHeight

    property real flipCardWidth: flipContent.width
    property real flipCardHeight: flipContent.height / segments
    property int flipCardCount: segments - 1

    signal beginFold()
    signal beginExpand()

    ShaderEffectSource{
        id: bottomCard
        width: flipCardWidth
        height: flipCardHeight
        anchors{left: parent.left; top: parent.top}
        sourceItem: flipContent
        sourceRect: Qt.rect(0, 0, flipCardWidth, flipCardHeight)
        z: flipContent.z + 1
    }

    Component{
        id: flipCardComponent
        Flipable{
            id: flipable
            width: root.flipCardWidth
            height: root.flipCardHeight
            property alias expandAnimation: expandAnimation
            property alias foldAnimation: foldAnimation
            property alias backItem: backItem
            property alias frontItem: frontItem
            property int index: 0

            property bool isFirstCard: index === 0
            property bool isLastCard: index === root.flipCardCount - 1

            transform: Rotation {
                id: rotation
                origin.x: flipable.width / 2
                origin.y: flipable.height
                axis.x: -1; axis.y: 0; axis.z: 0
                angle: 0
            }
            front: Item{
                id: frontItem
                anchors.fill: parent
                Rectangle{
                    anchors.fill: parent
                    color: "white"
                }
            }
            back: ShaderEffectSource{
                id: backItem
                sourceItem: flipContent
                sourceRect: Qt.rect(0, flipCardHeight * (index + 1), flipCardWidth, flipCardHeight)
                anchors.fill: parent
            }

            NumberAnimation{
                id: expandAnimation
                duration: expandSpeed
                target: rotation
                property: "angle"
                to: 180
                onStarted: {
                    root.height += flipCardHeight;
                    if(isFirstCard){
                        root.expanding = true;
                    }
                }

                onStopped: {
                    if(isLastCard){
                        flipContent.layer.enabled = false;
                        flipContent.visible = true;
                        bottomCard.visible = false;
                        root.expanding = false;
                        root.folded = false;
                    }
                }
            }
            NumberAnimation{
                id: foldAnimation
                duration: foldSpeed
                target: rotation
                property: "angle"
                to: 0
                onStarted: {
                    if(isLastCard){
                        flipContent.layer.enabled = true;
                        flipContent.visible = false;
                        bottomCard.visible = true;
                        root.folding = true;
                    }
                }

                onStopped: {
                    root.height -= flipCardHeight;
                    if(isFirstCard){
                        root.folding = false;
                        root.folded = true;
                    }
                }
            }
        }
    }

    Loader{
        id: firstCardLoader
        sourceComponent: flipCardComponent
        onLoaded: {
            var prev = firstCardLoader.item;
            root.beginExpand.connect(prev.expandAnimation.start);

            flipContent.parent = root;
            flipContent.visible = false;
            coverItem.parent = prev.frontItem;
            prev.parent = bottomCard;
            for(var i = 1; i < root.flipCardCount; i++){
                //console.log("create flip card ", i);
                var card = flipCardComponent.createObject(prev.backItem, {"index": i});
                prev.expandAnimation.stopped.connect(card.expandAnimation.start);
                if(i === root.flipCardCount - 1){
                    root.beginFold.connect(card.foldAnimation.start);
                }
                card.foldAnimation.stopped.connect(prev.foldAnimation.start);
                prev = card;
            }
        }
    }

    function expand(){
        root.beginExpand();
    }

    function fold(){
        root.beginFold();
    }
}
