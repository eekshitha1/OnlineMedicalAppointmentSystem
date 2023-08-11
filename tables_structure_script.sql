create database onlinemedicalappointment;
use onlinemedicalappointment;

# 1. Patient(p_uname(pk), p_pwd, p_gender, p_phnno, p_email, p_address);
create table Patient(
p_uname varchar(60) primary key,
p_pwd varchar(60),
p_gender varchar(10),
p_phnno varchar(20),
p_email  varchar(60),
p_address  varchar(60)
);

# 3. illness_type(illness_type_id(pk), illness_type_name);
create table illness_type( 
illness_type_id int primary key,
illness_type_name varchar(60)
);

# 5. Doctor(doc_uname(pk), doc_pwd, doc_fname, doc_lname, doc_phnno, doc_email, doc_address, illness_type_id(fk), doc_utype, doc_info);
create table Doctor(
doc_uname varchar(60) primary key,
doc_pwd varchar(60),
doc_fname varchar(60),
doc_lname varchar(60),
doc_phnno varchar(12),
doc_email varchar(60),
doc_address varchar(100),
illness_type_id int,
doc_utype varchar(40),
doc_info varchar(150),
constraint fk_illness_type_d foreign key (illness_type_id) references illness_type(illness_type_id)
);

# 2. Appointment(a_id(pk), a_date, a_bookingdate, a_status, a_desc, p_uname(fk), d_uname(fk));
create table Appointment(
a_id int primary key,
a_date timestamp,
a_bookingdate date,
a_status varchar(200),
a_desc  varchar(200),
p_uname varchar(60),
doc_uname varchar(60),
constraint patient_fk foreign key (p_uname) references Patient(p_uname),
constraint doctor_fk foreign key (doc_uname) references Doctor(doc_uname)
);

# 4. illness(i_id(pk), i_name, illness_category_id(fk));
create table illness(
i_id int primary key,
i_name varchar(200),
illness_type_id int,
constraint illness_type_fk foreign key (illness_type_id) references illness_type(illness_type_id)
);

# 20. Admin(admin_uname(pk), admin_pwd);
create table Admin(
admin_uname varchar(6) primary key,
admin_pwd varchar(60)
);

# 6. Doctor_leaves(leave_id(pk), start_date, end_date, leave_res, leave_status, doc_uname, admin_uname);
create table Doctor_leaves(
leave_id int primary key,
start_date varchar(40),
end_date varchar(40),
leave_res varchar(250),
leave_status varchar(40),
doc_uname varchar(60),
admin_uname varchar(60),
constraint admin_fk foreign key (admin_uname) references Admin(admin_uname),
constraint doc_fk1 foreign key (doc_uname) references Doctor(doc_uname)
);

# 7. Prescription(p_id(pk), a_id(fk));
create table Prescription( 
pres_id int primary key AUTO_INCREMENT,
a_id int,
constraint appointment_fk foreign key (a_id) references Appointment(a_id)
);

# ALTER table prescription modify prescription_id int AUTO_INCREMENT;

# 8. Medicine(med_id(pk), med_name, med_cost);
create table Medicine( 
med_id int primary key,
med_name varchar(200),
med_cost decimal(6,2)
);

# 9. Prescription_Medicine(pres_med_id(pk), pres_id(fk), med_id(fk));
create table Prescription_Medicine(
pres_med_id int primary key ,
pres_id int,
med_id int,
constraint pres_fk foreign key (pres_id) references Prescription(pres_id),
constraint med_fk foreign key (med_id) references Medicine(med_id)
);

# 10. Medical_Bill(med_bill_id(pk), med_tot_cost, p_id(fk));
create table Medical_Bill(
med_bill_id int primary key,
med_tot_cost decimal(6,2),
pres_id int,
constraint pres_fk2 foreign key (pres_id) references Prescription(pres_id)
);

# 11. Pharmacy(phar_id(pk), phar_name, phar_loc);
create table Pharmacy(
phar_id int primary key,
pha_name varchar(200),
phar_loc varchar(200)
);

# 12. Medicine_Pharmacy(med_phar_id(pk), med_id(fk), phar_id(fk)); 
create table Medicine_Pharmacy(
med_phar_id int primary key,
med_id int,
phar_id int,
constraint med_fk2 foreign key (med_id) references Medicine(med_id),
constraint phar_fk foreign key (phar_id) references Pharmacy(phar_id)
);

# 13. Lab_Prescription(lab_pres_id(pk), a_id(fk));
create table Lab_Prescription(
lab_pres_id int primary key,
a_id int,
constraint appointment_fk2 foreign key (a_id) references Appointment(a_id)
);

# 14. Lab_Service(lab_serv_id(pk), lab_serv_name, lab_serv_cost);
create table Lab_Service(
lab_serv_id int primary key,
lab_serv_name varchar(200),
lab_serv_cost decimal(6,2)
);

# 15. Lab_Prescription_Service(lab_pres_serv_id(pk), lab_pres_id(fk), lab_serv_id(fk));
create table lab_prescription_service(
lab_pres_serv_id int primary key,
lab_pres_id int,
lab_serv_id int,
constraint lab_prescription_fk foreign key (lab_pres_id) references Lab_Prescription(lab_pres_id),
constraint lab_service_fk foreign key (lab_serv_id) references Lab_Service(lab_serv_id)
);

# 16. Lab_Bill(lab_bill_id(pk), lab_totcost,  lab_pres_id(fk));
create table Lab_Bill(
lab_bill_id int primary key,
lab_totcost decimal(6,2),
lab_pres_id int,
constraint lab_prescription_fk2 foreign key (lab_pres_id) references Lab_Prescription(lab_pres_id)
);

# 17. Laboratoty(lab_id(pk), lab_name, lab_loc);
create table Laboratoty(
lab_id int primary key,
lab_name varchar(200),
lab_loc varchar(200)
);

# 18. Lab_Service_Laboratory(lab_serv_laboratory_id(pk), lab_serv_id(fk), lab_id(fk));
create table Lab_Service_Laboratory(
lab_serv_laboratory_id int primary key,
lab_serv_id int,
lab_id int,
constraint lab_service_fk2 foreign key (lab_serv_id) references Lab_service(lab_serv_id),
constraint lab_fk foreign key (lab_id) references Laboratoty(lab_id)
);

# 19. Joining(join_presc_id(pk), join_desc, approx_days, appointment_id(fk));  
create table Joining(
join_presc_id int primary key,
join_desc varchar(200),
approx_days int,
a_id int,
constraint appointment_fk3 foreign key (a_id) references Appointment(a_id)
);

# 21. FrequentQuestion(faq_id(pk), faq_question, faq_answer); 
create table FrequentQuestion(
faq_id int primary key, 
faq_question varchar(300), 
faq_nswer varchar(300),
admin_uname varchar(250),
constraint admin_faq_fk foreign key (admin_uname) references Admin(admin_uname)
);


