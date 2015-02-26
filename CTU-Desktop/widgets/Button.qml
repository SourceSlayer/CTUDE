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
    id:button
    property string buttonText: "CTU"
    property color background:"black"
    property color borderColor:"red"
    property string buttonHoverText: ""
    signal clicked()
    width: 70
    height: 31
    color:"transparent"
    clip:true
    Rectangle{
        id:mainArea
        width:parent.width-rightSide.width*2
        color:parent.background
        anchors.horizontalCenter: parent.horizontalCenter
        height:parent.height
        clip:false
        Text{
            id:textArea
            anchors.centerIn: parent
            color:borderColor
            text:button.buttonText
        }
    }
    ButtonSide{
        id:leftSide
        anchors.left:parent.left
        rotation:180
        background:parent.background
        borderColor:parent.borderColor
        smooth:true
    }
    ButtonSide{
        id:rightSide
        anchors.right:parent.right
        background:parent.background
        borderColor:parent.borderColor
        smooth:true
    }
    Rectangle{
         id:bottomBorder
         width:parent.width-leftSide.width
         height:1
         y:parent.height-1
         x:leftSide.width*.25-1.5
         color:borderColor
         smooth:true
     }
     Rectangle{
         id:topBorder
         width:parent.width-leftSide.width
         height:1
         y:0
         x:leftSide.width*.9
         smooth:true
         //x:Math.sqrt(Math.pow(parent.height*1.1, 2)-Math.pow(parent.height, 2))/2+1.5
         color:parent.borderColor
     }
    MouseArea{
        anchors.fill:parent
        hoverEnabled: true
        onEntered: {
            console.log("entered")
            reverseColors()
            if(buttonHoverText!="")
                textArea.text=buttonHoverText
        }
        onExited: {
            reverseColors()
            textArea.text=button.buttonText
        }
        onClicked: {
            parent.clicked()
        }
        function reverseColors(){
            var border=parent.borderColor;
            var background=parent.background;
            parent.borderColor=background;
            parent.background=border;
        }
    }
}
