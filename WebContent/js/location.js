// manager.jsp     book.jps     cinema.jsp에 사용됨
function area_choice(e) {
         var gangnam = ["1관", "2관", "3관"];
         var myeongdong = ["1관", "2관", "3관"];
         var songpa = ["1관", "2관", "3관"];
         var gwanggyo = ["1관", "2관", "3관"];
         var dongtan = ["1관", "2관", "3관"];
         var gyeyang = ["1관", "2관", "3관"];
         var bupyeong = ["1관", "2관", "3관"];
         var starget = document.getElementById("tnumber");
         var sopt;
         
         if(e.value == "강남") var area = gangnam;
         if(e.value == "명동") var area = myeongdong;
         if(e.value == "송파") var area = songpa;
         if(e.value == "광교") var area = gwanggyo;
         if(e.value == "동탄") var area = dongtan;
         if(e.value == "계양") var area = gyeyang;
         if(e.value == "부평") var area = bupyeong;
         

         starget.options.length = 0;

         for (y in area) {
            sopt = document.createElement("option");
            sopt.value = area[y];
            sopt.innerHTML = area[y];
            starget.appendChild(sopt);
         }   
      }





function city_choice(e) {
         var seoul = ["강남", "명동", "송파"];
         var gyeonggi = ["광교", "동탄"];
         var incheon = ["계양", "부평"];
         var target = document.getElementById("area");
         var opt;
         
         if(e.value == "서울") var d = seoul;
         else if(e.value == "경기") var d = gyeonggi;
         else if(e.value == "인천") var d = incheon;

         target.options.length = 0;

         for (x in d) {
            opt = document.createElement("option");
            opt.value = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
         }
         area_choice(opt)
         
      }