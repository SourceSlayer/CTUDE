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

Rectangle {
    id:window
    property string windowTitle: qsTr("Faith on high, Pride on Low")
    property url imageLocation: "../images/CTU-emblem.png"
    property url contentSource
    property int minimumWidth:200
    property int minimumHeight:200
    property int maximumWidth:1000
    property int maximumHeight:1000
    property alias contents:contentArea
    property bool hovered:false
    focus:true
    width: 300
    height: 300
    color:"transparent"
    border.width: 1;
    border.color: Qt.rgba(233, 233, 233, .5);
    MouseArea{
        anchors.fill:parent
        hoverEnabled: true
        drag.target: window
        onEntered: {
            parent.hovered=true
        }
        onExited: {
            parent.hovered=false
            titleBar.parent=parent
        }
    }
    Rectangle{
        id:titleBar
        width:parent.width-1
        height:20
        x:1
        y:1
        opacity:.5
        color:Qt.rgba(233,233,233,1)
        Image{
            id:windowIcon
            x:0
            y:0
            width:parent.height
            height:parent.height
            source:window.imageLocation
        }
        Text{
            id:titleText
            text:window.windowTitle
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            drag.target: window
            onEntered: {
                window.enableHoverMode()
            }
            onExited: {
                window.exitHoverMode()
            }
        }
        /*onXChanged: {
            window.x=titleBar.x;
        }
        onYChanged: {
            parent.y=y;
            console.log(parent.x);
            console.log(x);
        }*/
        Row{
            anchors.right: parent.right
            WindowButton{
                showImage: false
                showText: true
                buttonText:"X"
                onClicked: {
                    if(clicked)
                        closeWindow()
                }
            }
            WindowButton{
                showImage: false
                showText: true
                buttonText:"-"
            }
            WindowButton{
                showImage: false
                showText: true
                buttonText:"[]"
            }
        }
    }
    Rectangle{
        id:contentArea
        width:parent.width-2
        height:parent.height-titleBar.height
        y:titleBar.height
        x:1
        Loader{
            id:contentLoader
            source:contentSource
        }
    }
    Reparenter{

    }
    Rectangle{
        id:windowCorner
        width:10
        height:10
        x:parent.width-9
        y: parent.height-9
        MouseArea{
            anchors.fill:parent;
            drag.target: parent
        }
        onXChanged: {
            parent.width=x+9;
            if(parent.width>parent.maximumWidth && parent.maximumWidth!=0)
                parent.width=parent.maximumWidth
            else if(parent.width<parent.minimumWidth && parent.minimumWidth!=0)
                parent.width=parent.minimumWidth
        }
        onYChanged: {
            parent.height=y+9;
            if(parent.height>parent.maximumHeight && parent.maximumHeight!=0)
                parent.height=parent.maximumHeight
            else if(parent.height<parent.minimumHeight && parent.maximumHeight!=0)
                parent.height=parent.minimumHeight
        }
    }
    Keys.onPressed: {
        console.log("dsfd"+(event.modifiers))
        if((event.text=="w") && (event.modifiers==Qt.ControlModifier))
            closeWindow()
    }
    onHoveredChanged: {
        if(hovered){
            windowCorner.opacity=1
            titleBar.opacity=1
            window.border.color=Qt.rgba(233, 233, 233, 1)
            hovered=true
        }
        else{
            windowCorner.opacity=.5
            titleBar.opacity=.5
            window.border.color=Qt.rgba(233, 233, 233, .5)
        }
    }
    Behavior on opacity{
        enabled:true
        PropertyAnimation{
            duration:10
        }
    }
    function closeWindow(){
        opacity=.5
        window.destroy()
    }

}
