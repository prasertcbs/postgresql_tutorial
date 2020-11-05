-- สอน PostgreSQL: แสดงผลลัพธ์ที่ได้จาก SELECT ให้อยู่ในรูปแบบ JSON (output to JSON)
-- youtube: https://youtu.be/cOwoEymZwl4

drop table if exists province;

CREATE TABLE province (
    p_id varchar(3),
    name varchar(15),
    name_en varchar(24),
    region varchar(2),
    area_km2 real
);


INSERT INTO province VALUES ('กจ', 'กาญจนบุรี', 'Kanchanaburi', 'C', 19483.148);
INSERT INTO province VALUES ('กทม', 'กรุงเทพมหานคร', 'Bangkok', 'C', 1568.737);
INSERT INTO province VALUES ('จบ', 'จันทบุรี', 'Chanthaburi', 'C', 6338);
INSERT INTO province VALUES ('ฉช', 'ฉะเชิงเทรา', 'Chachoengsao', 'C', 5351);
INSERT INTO province VALUES ('ชน', 'ชัยนาท', 'Chainat', 'C', 2469.746);
INSERT INTO province VALUES ('ชบ', 'ชลบุรี', 'Chonburi', 'C', 4611.829000000001);
INSERT INTO province VALUES ('ตร', 'ตราด', 'Trat', 'C', 2819);
INSERT INTO province VALUES ('นฐ', 'นครปฐม', 'Nakhon Pathom', 'C', 2168.327);
INSERT INTO province VALUES ('นบ', 'นนทบุรี', 'Nonthaburi', 'C', 622.303);
INSERT INTO province VALUES ('นย', 'นครนายก', 'Nakhon Nayok', 'C', 2122);
INSERT INTO province VALUES ('ปข', 'ประจวบคีรีขันธ์', 'Prachuap Khiri Khan', 'C', 6367.62);
INSERT INTO province VALUES ('ปจ', 'ปราจีนบุรี', 'Prachinburi', 'C', 4762.362);
INSERT INTO province VALUES ('ปท', 'ปทุมธานี', 'Pathum Thani', 'C', 1525.856);
INSERT INTO province VALUES ('พบ', 'เพชรบุรี', 'Phetchaburi', 'C', 6225.138000000001);
INSERT INTO province VALUES ('รบ', 'ราชบุรี', 'Ratchaburi', 'C', 5196.462);
INSERT INTO province VALUES ('รย', 'ระยอง', 'Rayong', 'C', 3552);
INSERT INTO province VALUES ('ลบ', 'ลพบุรี', 'Lopburi', 'C', 6199.753000000001);
INSERT INTO province VALUES ('สก', 'สระแก้ว', 'Sa Kaeo', 'C', 7195.436);
INSERT INTO province VALUES ('สค', 'สมุทรสาคร', 'Samut Sakhon', 'C', 872.347);
INSERT INTO province VALUES ('สบ', 'สระบุรี', 'Saraburi', 'C', 3576.486);
INSERT INTO province VALUES ('สป', 'สมุทรปราการ', 'Samut Prakan', 'C', 1004.092);
INSERT INTO province VALUES ('สพ', 'สุพรรณบุรี', 'Suphan Buri', 'C', 5358.008000000001);
INSERT INTO province VALUES ('สส', 'สมุทรสงคราม', 'Samut Songkhram', 'C', 416.707);
INSERT INTO province VALUES ('สห', 'สิงห์บุรี', 'Sing Buri', 'C', 822.4780000000001);
INSERT INTO province VALUES ('อท', 'อ่างทอง', 'Ang Thong', 'C', 968.372);
INSERT INTO province VALUES ('อย', 'พระนครศรีอยุธยา', 'Phra Nakhon Si Ayutthaya', 'C', 2556.64);
INSERT INTO province VALUES ('กพ', 'กำแพงเพชร', 'Kamphaeng Phet', 'N', 8607.49);
INSERT INTO province VALUES ('ชม', 'เชียงใหม่', 'Chiang Mai', 'N', 20107.057);
INSERT INTO province VALUES ('ชร', 'เชียงราย', 'Chiang Rai', 'N', 11678.368999999999);
INSERT INTO province VALUES ('ตก', 'ตาก', 'Tak', 'N', 16406.65);
INSERT INTO province VALUES ('นน', 'น่าน', 'Nan', 'N', 11472.072);
INSERT INTO province VALUES ('นว', 'นครสวรรค์', 'Nakhon Sawan', 'N', 9597.677);
INSERT INTO province VALUES ('พจ', 'พิจิตร', 'Phichit', 'N', 4531.013);
INSERT INTO province VALUES ('พช', 'เพชรบูรณ์', 'Phetchabun', 'N', 12668.416000000001);
INSERT INTO province VALUES ('พย', 'พะเยา', 'Phayao', 'N', 6335.06);
INSERT INTO province VALUES ('พร', 'แพร่', 'Phrae', 'N', 6538.598000000001);
INSERT INTO province VALUES ('พล', 'พิษณุโลก', 'Phitsanulok', 'N', 10815.854);
INSERT INTO province VALUES ('มส', 'แม่ฮ่องสอน', 'Mae Hong Son', 'N', 12681.258999999998);
INSERT INTO province VALUES ('ลป', 'ลำปาง', 'Lampang', 'N', 12533.961000000001);
INSERT INTO province VALUES ('ลพ', 'ลำพูน', 'Lamphun', 'N', 4505.8820000000005);
INSERT INTO province VALUES ('สท', 'สุโขทัย', 'Sukhothai', 'N', 6596.092);
INSERT INTO province VALUES ('อต', 'อุตรดิตถ์', 'Uttaradit', 'N', 7838.592);
INSERT INTO province VALUES ('อน', 'อุทัยธานี', 'Uthai Thani', 'N', 6730.246);
INSERT INTO province VALUES ('กส', 'กาฬสินธุ์', 'Kalasin', 'NE', 6946.746);
INSERT INTO province VALUES ('ขก', 'ขอนแก่น', 'Khon Kaen', 'NE', 10885.991000000002);
INSERT INTO province VALUES ('ชย', 'ชัยภูมิ', 'Chaiyaphum', 'NE', 12778.287);
INSERT INTO province VALUES ('นค', 'หนองคาย', 'Nong Khai', 'NE', 3027.28);
INSERT INTO province VALUES ('นพ', 'นครพนม', 'Nakhon Phanom', 'NE', 5512.668000000001);
INSERT INTO province VALUES ('นภ', 'หนองบัวลำภู', 'Nong Bua Lamphu', 'NE', 3859.086);
INSERT INTO province VALUES ('นม', 'นครราชสีมา', 'Nakhon Ratchasima', 'NE', 20493.964);
INSERT INTO province VALUES ('บก', 'บึงกาฬ', 'Bueng Kan', 'NE', 4305);
INSERT INTO province VALUES ('บร', 'บุรีรัมย์', 'Buriram', 'NE', 10322.885);
INSERT INTO province VALUES ('มค', 'มหาสารคาม', 'Maha Sarakham', 'NE', 5291.683000000001);
INSERT INTO province VALUES ('มห', 'มุกดาหาร', 'Mukdahan', 'NE', 4339.83);
INSERT INTO province VALUES ('ยส', 'ยโสธร', 'Yasothon', 'NE', 4161.664000000001);
INSERT INTO province VALUES ('รอ', 'ร้อยเอ็ด', 'Roi Et', 'NE', 8299.449);
INSERT INTO province VALUES ('ลย', 'เลย', 'Loei', 'NE', 11424.612);
INSERT INTO province VALUES ('ศก', 'ศรีสะเกษ', 'Sisaket', 'NE', 8839.976);
INSERT INTO province VALUES ('สน', 'สกลนคร', 'Sakon Nakhon', 'NE', 9605.764000000001);
INSERT INTO province VALUES ('สร', 'สุรินทร์', 'Surin', 'NE', 8124.056);
INSERT INTO province VALUES ('อจ', 'อำนาจเจริญ', 'Amnat Charoen', 'NE', 3161.248);
INSERT INTO province VALUES ('อด', 'อุดรธานี', 'Udon Thani', 'NE', 11730.302);
INSERT INTO province VALUES ('อบ', 'อุบลราชธานี', 'Ubon Ratchathani', 'NE', 16112.65);
INSERT INTO province VALUES ('กบ', 'กระบี่', 'Krabi', 'S', 4708.512);
INSERT INTO province VALUES ('ชพ', 'ชุมพร', 'Chumphon', 'S', 6010.849);
INSERT INTO province VALUES ('ตง', 'ตรัง', 'Trang', 'S', 4917.519);
INSERT INTO province VALUES ('นธ', 'นราธิวาส', 'Narathiwat', 'S', 4475.43);
INSERT INTO province VALUES ('นศ', 'นครศรีธรรมราช', 'Nakhon Si Thammarat', 'S', 9942.502);
INSERT INTO province VALUES ('ปน', 'ปัตตานี', 'Pattani', 'S', 1940.356);
INSERT INTO province VALUES ('พง', 'พังงา', 'Phang Nga', 'S', 4170.895);
INSERT INTO province VALUES ('พท', 'พัทลุง', 'Phattalung', 'S', 3424.473);
INSERT INTO province VALUES ('ภก', 'ภูเก็ต', 'Phuket', 'S', 543.034);
INSERT INTO province VALUES ('ยล', 'ยะลา', 'Yala', 'S', 4521.0779999999995);
INSERT INTO province VALUES ('รน', 'ระนอง', 'Ranong', 'S', 3298.045);
INSERT INTO province VALUES ('สข', 'สงขลา', 'Songkhla', 'S', 7393.889);
INSERT INTO province VALUES ('สฎ', 'สุราษฎร์ธานี', 'Surat Thani', 'S', 12891.469);
INSERT INTO province VALUES ('สต', 'สตูล', 'Satun', 'S', 2478.9770000000003);



select * from province;

select json_agg(province) from province;

select json_agg(t) from 
	(select p_id abbr, name, region from province limit 3) t;
	
with t as (
	select p_id abbr, name, region from province limit 3
)
select json_agg(t) from t;

select region, array_agg(name_en) provinces 
	from province
	group by region;
	
with t as (
select region, array_agg(name_en) provinces 
	from province
	group by region
)
select json_agg(t) from t;