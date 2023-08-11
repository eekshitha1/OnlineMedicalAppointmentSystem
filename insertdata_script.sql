use onlinemedicalappointment;

delete from FrequentQuestion;
delete from Admin;
delete from Joining;
delete from Lab_Service_Laboratory;
delete from Laboratoty;
delete from Lab_Bill;
delete from Lab_Prescription_Service;
delete from Lab_Service;
delete from Lab_Prescription;
delete from Medicine_Pharmacy;
delete from Pharmacy;
delete from Medical_Bill;
delete from Prescription_Medicine;
delete from Medicine;
delete from Prescription;
delete from Doctor_leaves;
delete from Doctor;
delete from illness;
delete from illness_type;
delete from Appointment;
delete from Patient;

use onlinemedicalappointment;

# 1.   Patient(p_uname(pk), p_pwd, p_gender, p_phnno, p_email, p_address);
insert into Patient values('eekshi','eekshi','female','1111111111','eekshi@gmail.com','Neff st');
insert into Patient values('pinky','pinky','female','2222222222','pinky@gmail.com','Irving');
insert into Patient values('nishmith','nishmith','male','1234567890','nishmith@gmail.com','Louise st');
insert into Patient values('kushul','kushul','male','1234560987','kushul@gmail.com','Neff st');
insert into Patient values('aishu','aishu','female','3333333333','aishu@gmail.com','Fry st');

# 3.    illness_type(illness_type_id(pk), illness_type_name);
insert into illness_type values(1,'General');
insert into illness_type values(2,'ENT');
insert into illness_type values(3,'Cardiology');
insert into illness_type values(4,'Neurology');
insert into illness_type values(5,'Gynecology');

# 5.      Doctor(doc_uname(pk), doc_pwd, doc_fname, doc_lname, doc_phnno, doc_email, doc_address, illness_type_id(fk), doc_utype, doc_info);
insert into Doctor values('rishika','rishika1234','doctor rishika','pakala','7777777777','rishika@gmail.com','denton',4,'Doctor','MBBS');
insert into Doctor values('meghana','meghana1234','doctor meghana','koduri','6666666666','meghana@gmail.com','denton',1,'Doctor','MD');
insert into Doctor values('srija','srija1234','doctor srija','vemula','8888888888','srija@gmail.com','denton',5,'Doctor','PHD');


# 2. appointment   Appointment(a_id(pk), a_date, a_bookingdate, a_status, a_desc, p_uname(fk), d_uname(fk));
insert into Appointment values(1,'2022-04-22','2022-04-22','pending','pimples','eekshi','srija');
insert into Appointment values(2,'2022-04-22','2022-04-22','pending','cold','pinky','meghana');
insert into Appointment values(3,'2022-04-22','2022-04-22','pending','nerve pain','nishmith','rishika');


# 4. illness    illness(i_id(pk), i_name, illness_type_id(fk));
insert into illness values(1,'fever',1);
insert into illness values(2,'cold',1);
insert into illness values(3,'ear pain',2);
insert into illness values(4,'chest pain',3);
insert into illness values(5,'heart',3);
insert into illness values(6,'nerve pain',4);
insert into illness values(7,'pimples',5);

# 20.     Admin(admin_uname(pk), admin_pwd);
insert into Admin values('arun','arun1234');
insert into Admin values('keerthi','keerthi1234');
insert into Admin values('vyshu','vyshu1234');
insert into Admin values('sai','sai1234');
insert into Admin values('harsh','harsh1234');
insert into Admin values('eekhitha','eekshitha1234'); 

# 6. doctorleave   Doctor_leaves(leave_id(pk), start_date, end_date, leave_res, leave_status, doc_uname, admin_uname);
insert into Doctor_leaves values(1,'2022-11-03','2022-11-30','vacation','pending','srija','arun');
insert into Doctor_leaves values(2,'2022-12-04','2022-12-05','sick','pending','meghana','vyshu');
insert into Doctor_leaves values(3,'2022-12-25','2022-12-29','marriage','pending','rishika','harsh');


# 7. Prescription(p_id(pk), a_id(fk));
insert into Prescription values(1,1);
insert into Prescription values(2,2);
insert into Prescription values(3,3);
insert into Prescription values(4,1);
insert into Prescription values(5,2);

# 8. medicine   Medicine(med_id(pk), med_name, med_cost);
insert into Medicine values(1,'stodil',15.00);
insert into Medicine values(2,'crocin',8.00);
insert into Medicine values(3,'dolo',9.00);
insert into Medicine values(4,'citrigin',10.00);
insert into Medicine values(5,'aspirin',9.00);

# 9.    Prescription_Medicine(pres_med_id(pk), pres_id(fk), med_id(fk));
insert into Prescription_Medicine values(1,1,1);
insert into Prescription_Medicine values(2,1,3);
insert into Prescription_Medicine values(3,1,4);
insert into Prescription_Medicine values(4,2,3);
insert into Prescription_Medicine values(5,2,2);
insert into Prescription_Medicine values(6,3,3);
insert into Prescription_Medicine values(7,4,5);
insert into Prescription_Medicine values(8,5,2);


# 10. medical_bill  Medical_Bill(med_bill_id(pk), med_tot_cost, p_id(fk));
insert into Medical_Bill values(1,34.00,1);
insert into Medical_Bill values(2,17.00,2);
insert into Medical_Bill values(3,9.00,3);
insert into Medical_Bill values(4,9.00,4);
insert into Medical_Bill values(5,8.00,5);


# 11. pharmacy  Pharmacy(phar_id(pk), phar_name, phar_loc);
insert into Pharmacy values(1,'pvr','irving');
insert into Pharmacy values(2,'24*7','plano');
insert into Pharmacy values(3,'walmart','dallas');
insert into Pharmacy values(4,'torchys','denton');
insert into Pharmacy values(5,'costco','frisco');

# 12.  Medicine_Pharmacy(med_phar_id(pk), med_id(fk), phar_id(fk)); 
insert into Medicine_Pharmacy values(1,1,1);
insert into Medicine_Pharmacy values(2,2,3);
insert into Medicine_Pharmacy values(3,3,2);
insert into Medicine_Pharmacy values(4,4,4);
insert into Medicine_Pharmacy values(5,5,5);


# 13. Lab_Prescription(lab_pres_id(pk), a_id(fk));
insert into Lab_Prescription values(1,1);
insert into Lab_Prescription values(2,2);
insert into Lab_Prescription values(3,3);
insert into Lab_Prescription values(4,1);
insert into Lab_Prescription values(5,2);
insert into Lab_Prescription values(6,3);


# 14.  Lab_Service(lab_serv_id(pk), lab_serv_name, lab_serv_cost);
insert into Lab_Service values(1,'MRA',40.00);
insert into Lab_Service values(2,'MRI',39.00);
insert into Lab_Service values(3,'Urine Test',20.00);
insert into Lab_Service values(4,'X-Ray',51.00);
insert into Lab_Service values(5,'Blood Test',10.00);

# 15. Lab_Prescription_Service(lab_pres_serv_id(pk), lab_pres_id(fk), lab_serv_id(fk));
insert into lab_prescription_service values(1,1,4);
insert into lab_prescription_service values(2,2,3);
insert into lab_prescription_service values(3,3,5);
insert into lab_prescription_service values(4,4,1);
insert into lab_prescription_service values(5,5,2);



# 16. Lab_Bill(lab_bill_id(pk), lab_totcost,  lab_pres_id(fk));
insert into Lab_Bill values(1,51.00,1);
insert into Lab_Bill values(2,20.00,2);
insert into Lab_Bill values(3,10.00,3);
insert into Lab_Bill values(4,40.00,4);
insert into Lab_Bill values(5,39.00,5);



# 17. Laboratoty(lab_id(pk), lab_name, lab_loc);
insert into Laboratoty values(1,'vijaya lab','denton');
insert into Laboratoty values(2,'geno lab','irving');
insert into Laboratoty values(3,'pvr lab','plano');
insert into Laboratoty values(4,'apolo lab','dallas');
insert into Laboratoty values(5,'vbr lab','frisco');

# 18. Lab_Service_Laboratory(lab_serv_laboratory_id(pk), lab_serv_id(fk), lab_id(fk));
insert into Lab_Service_Laboratory values(1,1,5);
insert into Lab_Service_Laboratory values(2,5,4);
insert into Lab_Service_Laboratory values(3,4,3);
insert into Lab_Service_Laboratory values(4,3,2);
insert into Lab_Service_Laboratory values(5,2,1);

# 19. Joining(join_presc_id(pk), join_desc, approx_days, appointment_id(fk)); 
insert into Joining values(1,'general ward',10,1);
insert into Joining values(2,'ICU',7,2);
insert into Joining values(3,'hospital',3,3);


# 21. FrequentQuestion(faq_id(pk), faq_question, faq_answer,admin_uname(fk));
insert into FrequentQuestion values(1,'how to book apt','login, then go to diseases, select a disease and click','vyshu');
insert into FrequentQuestion values(2,'how to add faq','admin login, click on faq, then add faq','harsh');
insert into FrequentQuestion values(3,'what are the different categories avaliable','general, ent, cardiology and neurology','arun');
insert into FrequentQuestion values(4,'how to check prescriptions','go to view appointments in patient login','sai');





