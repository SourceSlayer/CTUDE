/*
Copyright (c) 2014-2015, Seth Nash
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the <organization>.
4. Neither the name of the <organization> nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY <COPYRIGHT HOLDER> ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtWebKit 1.0
import "widgets"
/*With the invention of the triangle, many problems involving sides will be solved*/
Rectangle {
    width: 360
    height: 360
    Rectangle{
        id:desktop
        anchors.fill: parent;
        color:"blue"
        MouseArea{
            id:generalMouseArea
            anchors.fill:parent
            onClicked: {
                selectionArea.x=drag.minimumX;
                selectionArea.y=drag.minimumY;
                selectionArea.width=drag.x
            }
        }
        Image{
            id:ctuEmblem
            anchors.centerIn: parent
            source:"images/CTU-emblem.png"
        }
        TypedText {
            anchors.centerIn: parent
            typedText: "Counter-Terrorism Unit"
        }
        focus:true
        Rectangle{
            id:activeArea
            width:parent.width
            height:parent.height-topBarContainer.height-bottomBarContainer.height
            y:topBarContainer.height
            color:"transparent"
            Rectangle{
                id:windowArea
                anchors.fill:parent;
                color:"transparent";

                function loadWindow(source, x, y, width, height){
                    var newWindow=Qt.createComponent(source);
                    newWindow.createObject(windowArea);
                }
                function insertWindow(component, holder){
                    console.log("test")
                    if(holder==undefined)
                        holder=parent
                    /*if(component.Status==Component.Ready)
                        */window=component.createObject(holder)
                    /*else
                        console.log("[1] Could not create window: "+component.errorString())*/
                    if(window==null)
                        desktop.showError(1, "Could not create window", "Failed to make object. \n"+component.errorString())

                }
            }
            Rectangle{
                id:selectionArea
                color:Qt.rgba(20,20,60,.9);
                onXChanged: {
                    console.log(x)
                }
            }
            /*MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered:{
                    parent.color=Qt.rgba(255,255,255,.5)
                    console.log("Window Container efewcew: size("+windowContainer.height+", "+.width+")")
                }
                onExited: {
                    parent.color="transparent"
                }
            }*/
        }
        Rectangle{
            id:topAreaContainer
            width:parent.width;
            height:100
            color:"transparent"
            Rectangle{
                id:topBarContainer
                width:parent.width
                height:51
                color:"red";
                Rectangle{
                    id:topBar
                    color:"black"
                    width:parent.width
                    height:50
                    Rectangle{
                        x:100
                        y:5
                        color:"purple"
                        Rectangle{
                            color:"red"
                            height:10
                            y:15
                            x:parent.x
                            width:parent.width*.75
                        }
                        Row{
                            id:topBarButtonContainer

                            Button{
                                buttonText:qsTr("CPU")
                                onClicked: {
                                    windowArea.loadWindow("../apps/SystemMonitor/SystemMonitor.qml", 50, 50, 500, 500)
                                }
                            }
                            Button{
                                buttonText:"RAM"
                            }
                        }
                    }
                }
                Rectangle{
                    id:angledSide
                    y:50
                    height:120
                    width:132
                    color: "transparent"
                    Rectangle{
                        id:sealContainerArea
                        height:parent.height
                        width:parent.width
                        color:"transparent"
                        Rectangle{
                            id:sealContainerSide
                            height:parent.height-1
                            width:29.4
                            color:"black"
                            x:flatSide.width/2+width-1
                            y:-6
                            rotation:15
                            Rectangle{
                                width:1
                                height:parent.height
                                anchors.left:parent.right
                                color:"red"
                            }
                        }
                        Rectangle{
                            id:flatSide
                            color:"black";
                            height:parent.height*.95
                            width:parent.width*.65-1
                            Image{
                                anchors.horizontalCenter: angledSide.horizontalCenter
                                anchors.centerIn: parent;
                                source:"images/CTU-emblem.png"
                                smooth:true
                                width:angledSide.width*.5
                                fillMode:Image.PreserveAspectFit
                            }
                            Rectangle{
                                width:parent.width
                                height:1
                                anchors.top:parent.bottom
                                color:"red"
                            }
                        }
                    }
                }
            }
            /*MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color=Qt.rgba(0,0,0,.5)
                }
                onExited: {
                    parent.color="transparent"
                }
            }*/
            Text{
                id:windowTitle
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text:"ApplicationName"
                font.pixelSize: 20
                color:"white"
                styleColor:"Black"
                style:Text.Sunken
            }
        }
        Rectangle{
            id:bottomAreaContainer
            color:"transparent"
            width:parent.width
            height:150
            anchors.bottom:parent.bottom
            Rectangle{
                id:bottomBarContainer
                color:"red"
                height:76
                width:parent.width
                anchors.bottom:parent.bottom
                Rectangle{
                    id:bottomBar
                    color:"black"
                    height:75
                    width:parent.width
                    anchors.bottom: parent.bottom

                }
            }
            Rectangle{
                id:applicationTitleArea
                anchors.left:parent.left
                color:"transparent"
                height:51
                width:150
                y:24
                Rectangle{
                    rotation:330;
                    width:30
                    height:parent.height+10
                    color:"black"
                    y:1.5
                    anchors.right:parent.right
                    Rectangle{
                        width:.25
                        height:parent.height
                        anchors.right: parent.right
                        color:"red"
                    }
                }
                Rectangle{
                    anchors.left:parent.left
                    color:"red"
                    width:132
                    y:-2
                    height:parent.height+3
                    Rectangle{
                        height:parent.height-1
                        color:"black"
                        anchors.bottom:parent.bottom
                        width:parent.width
                    }
                }
            }
        }
    }
    Rectangle{
        id:loginScreen
        visible: false
        anchors.fill:parent
        color:"blue"
        LoginWindow{
            color:"white"
            anchors.centerIn: parent
        }

    }
    Rectangle{
        id:screenSaver
        color:"black"
        visible: false
        anchors.fill:parent
        /*LCDCharacter{
            character:"1"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.character="8";
                    console.log("dfsdf");
                }
            }
        }*/
        Rectangle{
            id:timerContainer
            anchors.centerIn: parent
            width:520
            height:200
            color:"transparent"
            LCDCharacter{
                id:hourDisplayZero
            }
            LCDCharacter{
                id:hourDisplaySingle
                x:76
                y: 0
            }
            LCDCharacter{
                id:minuteDisplayZero
                x:180
            }
            LCDCharacter{
                id:minuteDisplaySingle
                x:255
            }
            LCDCharacter{
                id:secondDisplayZero
                x:360
            }
            LCDCharacter{
                id:secondisplaySingle
                x:465
            }
            function updateTime(){
                var timeString=Qt.formatDateTime(new Date(), "hh0mm0ss")+" ";
                hourDisplayZero.character=timeString[0];
                hourDisplaySingle.character=timeString[1];
                minuteDisplayZero.character=timeString[3];
                minuteDisplaySingle.character=timeString[4];
                secondDisplayZero.character=timeString[6];
                secondisplaySingle.character=timeString[7];x
            }
            Timer{
                id:screenSaverTimer
                interval: 1000
                running:false
                repeat:false
                onTriggered: {
                    parent.updateTime()
                }
            }
        }
        MouseArea{
            visible: true
            anchors.fill:parent
            onEntered:{
                screenSaver.visible=false
            }
        }
        function showError(priority, title, message){
            console.log("["+priority+"] "+qsTr(title)+": "+message)
        }
    }
    state:"inactive"
    states: [
        State {
            name: "inactive"

            PropertyChanges {
                target: screenSaver
                visible: true
            }
            PropertyChanges{
                target:screenSaverTimer
                running:true
                repeat:true
            }
        },
        State{
            name:"signedOut"
            PropertyChanges{
                target:loginScreen
                visible:true
            }
            PropertyChanges{
                target:screenSaver
                visible:false
            }
        }
    ]
}
