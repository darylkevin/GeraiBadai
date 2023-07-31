package gr.GeraiBadai.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Type {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long typeId;
	private boolean onDemand;

	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getTypeId() {
		return typeId;
	}

	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}

	public boolean isOnDemand() {
		return onDemand;
	}

	public void setOnDemand(boolean onDemand) {
		this.onDemand = onDemand;
	}




	
}
