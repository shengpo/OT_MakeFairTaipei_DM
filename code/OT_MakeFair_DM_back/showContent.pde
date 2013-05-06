void showContent(){
        //pictures
        image(ot_logo, width*0.82, height*0.45);
        image(qr, width*0.05, height*0.445);
        image(blogger, width*0.82, height*0.51);
        image(facebook, width*0.82, height*0.54);
        
        //texts
        fill(0);
        text("scan the code to get the code", width*0.1, height*0.46);
        text("http://goo.gl/0Nu1y", width*0.1, height*0.49);
        text("www.openlabtaipei.org", width*0.85, height*0.523);
        text("/groups/openlab.taipei", width*0.85, height*0.553);
        text("Openlab.Taipei是選擇以開放程式碼和自由軟體為創作工具的藝術家聚集之地，而這空間並不一定有固定的狀態，它可能會發生在網路、IRC、咖啡廳、藝文空間、替代空間和工作室，同時也沒有時間的限制。我們在這裡推廣使用FLOSS去實踐、實驗和玩樂數位藝術創作的各種面向，並且驗證自由軟體與藝術的結合是數位藝術中一股重要的力量和趨勢。", 
                width*0.02, height*0.9, width*0.97, height*0.1);
}
