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
    id:windowButton
    property url imageSource
    property string buttonText:qsTr("Hola")
    property bool showImage:true
    property bool showText:true
    signal clicked();
    width: 18
    height: 18
    opacity:1
    border.width:1
    color:Qt.rgba(130,40,40,1)
    Image{
        anchors.fill: parent
        visible:parent.showImage
        height:parent.height
        width:parent.width
        source:parent.imageSource
    }
    Text{
        id:displayedText
        anchors.right:parent.right
        text:parent.buttonText
        visible:parent.showText
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true;
        onEntered: {
            parent.opacity=1
        }
        onExited: {
            parent.opacity=.2
        }
        onClicked: {
            parent.opacity=1;
            parent.clicked()
        }
        onReleased: {
            parent.opacity=.3;
            parent.clicked=false;
        }
    }
}
