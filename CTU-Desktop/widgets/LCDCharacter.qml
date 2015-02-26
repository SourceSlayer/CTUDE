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
    property string character
    property double textSize:4
    height:100
    width:55
    color:"transparent"
    Image{
        id:topSide
        width:parent.width
        height: 100
        x:0
        y:parent.height*-.5
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:500
                from:.5
            }
        }
    }
    Image{
        id:leftTopSide
        width:parent.width
        height: 100
        x:parent.width*-.5
        y:parent.height*-.1
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        rotation:90
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:750
                from:.1
            }
        }
    }
    Image{
        id:rightTopSide
        width:parent.width
        height: 100
        x:parent.width*.5
        y:parent.height*-.1
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        rotation:270
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:750
                from:.1
            }
        }
    }
    Image{
        id:middleVerticalSide
        width:parent.width
        height: 100
        x:2
        y:parent.height*.3
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:800
                from:.1
            }
        }
    }
    Image{
        id:rightBottomSide
        width:parent.width
        height: 100
        x:parent.width*.5+1
        y:parent.height*.675
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        rotation:270
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:850
                from:.1
            }
        }
    }
    Image{
        id:leftBottomSide
        width:parent.width
        height: 100
        x:parent.width*-.5-1
        y:parent.height*.675
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        rotation:90
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:850
                from:.1
            }
        }
    }
    Image{
        id: bottomSide
        width:parent.width
        height: 100
        x:2
        y:parent.height
        fillMode:Image.PreserveAspectFit
        source:"../images/LCD-Bar 1.png"
        opacity:.1
        Behavior on opacity{
            enabled:true
            PropertyAnimation{
                duration:1000
                from:.1
            }
        }
    }
    function lightSide(side){
        side.opacity=.9;
    }
    function hideSide(side){
        side.opacity=.1;
    }
    function lightAsCharacter(character){
        var allItems=[topSide, leftTopSide, rightTopSide, middleVerticalSide, rightBottomSide, leftBottomSide, bottomSide]
        var characters={
            "0":[topSide, leftTopSide, rightTopSide, rightBottomSide, leftBottomSide, bottomSide],
            "1":[rightTopSide, rightBottomSide],
            "2":[topSide, rightTopSide, middleVerticalSide, leftBottomSide, bottomSide],
            "3":[topSide, rightTopSide, middleVerticalSide, rightBottomSide, bottomSide],
            "4":[rightTopSide, middleVerticalSide, leftTopSide, rightBottomSide],
            "5":[topSide, leftTopSide, middleVerticalSide, rightBottomSide, bottomSide],
            "6":[topSide, leftTopSide, middleVerticalSide, rightBottomSide, leftBottomSide, bottomSide],
            "7":[topSide, rightTopSide, rightBottomSide],
            "8":allItems,
            "9":[topSide, leftTopSide, rightTopSide, middleVerticalSide, rightBottomSide, bottomSide]
        }
        var lightList=characters[character];
        for(var i=0;i<allItems.length;i++)
            hideSide(allItems[i]);
        for(var i=0;i<lightList.length;i++){
            lightSide(lightList[i]);
        }
    }
    onCharacterChanged: {
        lightAsCharacter(character)
    }
    MouseArea{
        anchors.fill: parent;
        hoverEnabled: true
        onEntered:{
            parent.state="active"
        }
    }
}
