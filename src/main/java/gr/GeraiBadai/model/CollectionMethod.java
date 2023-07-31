package gr.GeraiBadai.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class CollectionMethod {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long collectionMethodId;
	private boolean how;

	public CollectionMethod() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getCollectionMethodId() {
		return collectionMethodId;
	}

	public void setCollectionMethodId(long collectionMethodId) {
		this.collectionMethodId = collectionMethodId;
	}

	public boolean isHow() {
		return how;
	}

	public void setHow(boolean how) {
		this.how = how;
	}
	
	
	
}
