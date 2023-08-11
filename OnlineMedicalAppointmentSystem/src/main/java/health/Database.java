package health;

import java.sql.*;
import java.util.ArrayList;

public class Database{

		
public static Connection connectionDriver()throws Exception {
	Class.forName("com.mysql.cj.jdbc.Driver");
    return DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinemedicalappointment","root","");
}

public static String registerAccount(String uname,String pass,String gender,String contact,String email,String address)throws Exception {
	String message="Error in creating account";
	Connection dbcon = connectionDriver();
	Statement s = dbcon.createStatement();
	ResultSet rset = s.executeQuery("select p_uname from patient where p_uname = '"+uname+"'");
	if(rset.next()){
		message = "username already exists";
		return message;
	}
	PreparedStatement ps = dbcon.prepareStatement("insert into patient values(?,?,?,?,?,?)");
	ps.setString(1,uname);
	ps.setString(2,pass);
	ps.setString(3,gender);
	ps.setString(4,contact);
	ps.setString(5,email);
	ps.setString(6,address);
	int count = ps.executeUpdate();
	rset.close();s.close();ps.close();
	if(count > 0) {
		message="Successful creation of account";
	}
	dbcon.close();
	return message;
}

public static String deleteFAQ(String id)throws Exception {
	String message="FAQ deletion Error";
	Connection dbcon = connectionDriver();
	PreparedStatement ps = dbcon.prepareStatement("delete from frequentquestion where faq_id=?");
	ps.setString(1,id);
	int count = ps.executeUpdate();
	ps.close();
	if(count > 0) {
		message = "Deleted selected "+id+" FAQ details";
	}
	return message;
}

public static String deleteDoctor(String uname)throws Exception {
	String message="Doctor deletion error";
	Connection dbcon = connectionDriver();
	PreparedStatement ps1 = dbcon.prepareStatement("delete from doctor_leaves where doc_uname=?");
	PreparedStatement ps2 = dbcon.prepareStatement("delete from doctor where doc_uname=?");
	ps1.setString(1,uname);
	ps2.setString(1, uname);
	ps1.close();
	int count2 = ps2.executeUpdate();
	ps2.close();
	if(count2 > 0) {
		message = "Deleted selected "+uname+" doctor details";
	}
	return message;
}

public static String addFAQ(String question,String answer)throws Exception {
	String message="FAQ addition error";
	int count = 0;
	int faqId = 0;
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rs = st.executeQuery("select MAX(faq_id) from frequentquestion");
	if(rs.next()) {
		faqId = rs.getInt(1)+1;
	}
	//faqId = faqId + 1;
	PreparedStatement ps = dbcon.prepareStatement("insert into frequentquestion(faq_id,faq_question,faq_answer) values(?,?,?)");
	ps.setInt(1,faqId);
	ps.setString(2,question);
	ps.setString(3,answer);
	count = ps.executeUpdate();
	rs.close();st.close();ps.close();
	if(count > 0) {
		message="Added FAQ details successfully";
	}
	dbcon.close();
	return message;
}

public static String acceptLeave(String id,String status)throws Exception{
	String message="Leave updation error";
	Connection dbcon = connectionDriver();
	PreparedStatement ps = dbcon.prepareStatement("update doctor_leaves set leave_status=? where leave_id=?");
	ps.setString(1,status);
	ps.setString(2,id);
	int count = ps.executeUpdate();
	if(count > 0) {
		message = "Doctor's leave is"+status;
	}
	return message;
}

public static String applyForLeave(String doctor,String reason,String from,String to)throws Exception{
	String message="Leave addition error";
	int count = 0;
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rs = st.executeQuery("select MAX(leave_id) from doctor_leaves");
	if(rs.next()) {
		count = rs.getInt(1)+1;
	}
	count = count + 1;
	PreparedStatement ps = dbcon.prepareStatement("insert into doctor_leaves values(?,?,?,?,?,?,NULL)");
	ps.setInt(1,count);
	ps.setString(2,from);
	ps.setString(3,to);
	ps.setString(4,reason);
	ps.setString(5,"pending");
	ps.setString(6,doctor);
	count = ps.executeUpdate();
	rs.close();st.close();ps.close();
	if(count > 0) {
		message = "Leave request is submitted to admin successfully";
	}
	return message;
}

public static String addDoctor(String fname,String lname,String contact,String email,String address,String details,String speciality,String uname,String pass,String type)throws Exception{
	String msg="Doctor account creation error";
	Connection dbcon = connectionDriver();
	Statement s = dbcon.createStatement();
	ResultSet rset = s.executeQuery("select doc_uname from doctor where doc_uname = '"+uname+"'");
	if(rset.next()){
		msg = "Given username already exists";
	}
	ResultSet rset2 = s.executeQuery(String.format("select illness_type_id from illness_type where illness_type_name='%s'",speciality));
	if(rset2.next()) {
		
	
	PreparedStatement ps = dbcon.prepareStatement("insert into doctor values(?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,uname);
	ps.setString(2,pass);
	ps.setString(3,fname);
	ps.setString(4,lname);
	ps.setString(5,contact);
	ps.setString(6,email);
	ps.setString(7,address);
	ps.setInt(8,rset2.getInt(1));
	ps.setString(9,type);
	ps.setString(10,details);
	int count = ps.executeUpdate();
	rset.close(); rset2.close(); s.close();ps.close();
	if(count > 0) {
		if(type.equals("Doctor"))
			msg="Details of doctor added successfully";
		if(type.equals("Nurse"))
			msg="Details of nurse added successfully";
	}
	}
	dbcon.close();
	return msg;
}

public static Integer prescriptionCreation(Integer appointmentId)throws Exception{
	String message="Prescription ID creation error";
	int prescription_Id=1;
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rset = st.executeQuery(String.format("select pres_id from prescription where a_id = %d", appointmentId));
	if(rset.next()) {
		//Prescription already exists
		return rset.getInt(1);
	}
	rset = st.executeQuery("select count(*) from prescription");
	if(rset.next()){
		prescription_Id = rset.getInt(1) + 1;
	}
	PreparedStatement ps = dbcon.prepareStatement("insert into prescription (pres_id, a_id)values(?,?)");
	ps.setInt(1,prescription_Id);
	ps.setInt(2,appointmentId);
	int count = ps.executeUpdate();
	rset.close();st.close();ps.close();
	if(count > 0) {
		message="Prescription ID successfully added";
	}
	dbcon.close();
	return prescription_Id;
}

public static Integer LabPrescriptionAddition(Integer appointmentId)throws Exception{
	String msg="Prescription ID addition error";
	int prescriptionId=1;
	Connection dbconnect = connectionDriver();
	Statement st = dbconnect.createStatement();
	ResultSet rset = st.executeQuery(String.format("select lab_pres_id from lab_prescription where a_id = %d", appointmentId));
	if(rset.next()) {
		//Prescription already exists
		return rset.getInt(1);
	}
	rset = st.executeQuery("select count(*) from lab_prescription");
	if(rset.next()){
		prescriptionId = rset.getInt(1) + 1;
	}
	PreparedStatement ps = dbconnect.prepareStatement("insert into lab_prescription (lab_pres_id, a_id)values(?,?)");
	ps.setInt(1,prescriptionId);
	ps.setInt(2,appointmentId);
	int count = ps.executeUpdate();
	rset.close();st.close();ps.close();
	if(count > 0) {
		msg="Successful addition of Prescription ID";
	}
	dbconnect.close();
	return prescriptionId;
}

public static String appointmentAcceptance(String id, String status)throws Exception{
	String msg="error in updating status as "+status;
	Connection dbconnect = connectionDriver();
	PreparedStatement ps = dbconnect.prepareStatement("update appointment set a_status=? where a_id=?");
	ps.setString(1,status);
	ps.setString(2,id);
	int count = ps.executeUpdate();
	if(count > 0) {
		msg = "Status of appointment is updated as "+status;
	}
	return msg;
}

public static String login(String user,String pass)throws Exception{
	String message="no";
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rset = st.executeQuery("select doc_utype from doctor where doc_uname='"+user+"' and doc_pwd='"+pass+"'");
	while(rset.next()){
		message = rset.getString(1);
	}
	rset.close();st.close();dbcon.close();
	return message;
}

public static String patientLogin(String user,String pass)throws Exception{
	String message="no";
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rset = st.executeQuery("select p_uname from patient where p_uname='"+user+"' and p_pwd='"+pass+"'");
	while(rset.next()){
		message = "success";
	}
	rset.close();st.close();dbcon.close();
	return message;
}

public static String adminLogin(String user,String pass)throws Exception{
	String message="no";
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rset = st.executeQuery("select admin_uname from admin where admi"
			+ "n_uname='"+user+"' and admin_pwd='"+pass+"'");
	while(rset.next()){
		message = "success";
	}
	rset.close(); 
	//if(user.equals("admin") && pass.equals("admin"))
	//	message = "success";
	st.close();dbcon.close();
	return message;
}

@SuppressWarnings("deprecation")
public static String appointment(String doctor,String patient,String desc,String date)throws Exception {
	String message="Appointment booking Error";
	int id = 0;
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	ResultSet rset = st.executeQuery("select count(*) from appointment");
	if(rset.next()){
		id = rset.getInt(1);
	}
	rset.close();st.close();
	id = id + 1;
	java.util.Date t = new java.util.Date();
	java.sql.Date current_date = new java.sql.Date(t.getTime());

	t = new java.util.Date(date.trim());
	java.sql.Timestamp appointment_time = new java.sql.Timestamp(t.getTime());
	PreparedStatement ps = dbcon.prepareStatement("insert into appointment values(?,?,?,?,?,?,?)");
	ps.setInt(1,id);
	ps.setTimestamp(2,appointment_time);
	ps.setDate(3,current_date);
	ps.setString(4,"pending");
	ps.setString(5,desc);
	ps.setString(6,patient);
	ps.setString(7,doctor);
	
	int count = ps.executeUpdate();
	rset.close();st.close();ps.close();
	if(count > 0) {
		message="Successfull confirmation of appointment slot";
	}
	dbcon.close();
	return message;
}

public static String medicineAddition(Integer prescriptionId, Integer medicineId) {
	
	String msg="Medicine Prescription ID addition error";
	int pres_medId=1;
	try {
	Connection dbconnect = connectionDriver();
	Statement st = dbconnect.createStatement();
	ResultSet rset = st.executeQuery("select MAX(pres_med_id) from prescription_medicine");
	if(rset.next()) {
		pres_medId = rset.getInt(1)+1;
	}
	PreparedStatement ps = dbconnect.prepareStatement("insert into prescription_medicine (pres_med_id,pres_id, med_id)values(?,?,?)");
	ps.setInt(1, pres_medId);
	ps.setInt(2,prescriptionId);
	ps.setInt(3,medicineId);
	int count = ps.executeUpdate();
	st.close();ps.close();dbconnect.close();
	if(count > 0) {
		msg="Medicine Prescription Successfully Added";
	}
	} catch(Exception e) {
		e.printStackTrace();
	}
	return msg;
	
}

public static String LabServiceAddition(Integer prescriptionId, Integer labServiceId) {
	
	String message="Lab Prescription details addition error";
	int lab_pres_servId = 1;
	try {
	Connection dbcon = connectionDriver();
	Statement st = dbcon.createStatement();
	/*ResultSet rset = st.executeQuery(String.format("select count(*) from lab_prescription_service where lab_pres_id= %d and lab_serv_id=%d", prescriptionId, labServiceId));
	if(rset.next() && rset.getInt(1)>=1) {
		return message;
	}*/
	ResultSet rs = st.executeQuery("select MAX(lab_pres_serv_id) from lab_prescription_service");
	if(rs.next()) {
		lab_pres_servId = rs.getInt(1)+1;
	}
	PreparedStatement ps = dbcon.prepareStatement("insert into lab_prescription_service (lab_pres_serv_id,lab_pres_id, lab_serv_id)values(?,?,?)");
	ps.setInt(1, lab_pres_servId);
	ps.setInt(2,prescriptionId);
	ps.setInt(3,labServiceId);
	int count = ps.executeUpdate();
	st.close();ps.close();dbcon.close();
	if(count > 0) {
		message="Lab Prescription Successfully Added";
	}
	} catch(Exception e) {
		e.printStackTrace();
	}
	return message;
	
}

public static String JoiningPrescriptionAddition(String joiningDesc, Integer approxDays, Integer appointmentId) {
	String message = "Addition of Joining prescription creating an error";
	int joining_PrescriptionId = 1;
	try {
		Connection dbcon = connectionDriver();
		Statement st = dbcon.createStatement();
		ResultSet rs = st.executeQuery("select MAX(join_presc_id) from joining");
		if(rs.next()) {
			joining_PrescriptionId = rs.getInt(1)+1;
		}
		PreparedStatement ps = dbcon.prepareStatement("insert into joining values(?,?,?,?)");
		ps.setInt(1,joining_PrescriptionId);
		ps.setString(2, joiningDesc);
		ps.setInt(3, approxDays);
		ps.setInt(4, appointmentId);
		int count = ps.executeUpdate();
		st.close(); ps.close(); dbcon.close();
		if(count>0) {
			message = "Joining Details Added";
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return message;
}

public static ArrayList<String> retrieveListPharmacy(Integer medicine_Id) {
	ArrayList<String> pharmacy_List = new ArrayList<>();
	
	try {
		Connection dbcon = connectionDriver();
		Statement st = dbcon.createStatement();
		ResultSet rs = st.executeQuery(String.format("select distinct(p.phar_name)\n"
				+ "from medicine_pharmacy pm, pharmacy p\n"
				+ "where pm.phar_id = p.phar_id and pm.med_id=%d", medicine_Id));
		while(rs.next()) {
			pharmacy_List.add(rs.getString(1));
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return pharmacy_List;
}

}






