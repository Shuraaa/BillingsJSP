/**
 * 
 * @author VinhPhu
 *
 */
package model;

/**
 * @author pc
 *
 */
public class Person {
	String stt, name, age, gender, add;

	public Person(String stt, String name, String age, String gender, String add) {
		super();
		this.stt = stt;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.add = add;
	}

	public String getStt() {
		return stt;
	}

	public void setStt(String stt) {
		this.stt = stt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}

	@Override
	public String toString() {
		return "Person [stt=" + stt + ", name=" + name + "]";
	} 

}
