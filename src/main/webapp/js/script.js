document.addEventListener('DOMContentLoaded', () => {
    const positionCardContainer = document.querySelector('.position-card-container');
    positionCardContainer.addEventListener('click', event => { 
        // if the element that was clicked is of the type checkbox (see jsp)
        if (event.target.type === 'checkbox') {
            // figure out the boolean state of the checkbox after the click was
			// registered
            let checked = event.target.checked;
            let positionId = event.target.parentElement.parentElement.parentElement.parentElement.id;
            let card = event.target.parentElement.parentElement.parentElement.parentElement;

            updateDisplayedPosition(positionId, checked);
            
            if(checked){
            	card.insertAdjacentHTML('beforeend', '<p id="statusP">This position is now displayed</p>');
            	
                setTimeout(() => {
                	   let elem = card.querySelector('#statusP');
                	   elem.parentNode.removeChild(elem);
                    }, 3000);
                
            	clearTimeout();


            }
            else{
            	card.insertAdjacentHTML('beforeend', '<p id="statusQ">This position is no longer displayed</p>');
           
                setTimeout(() => {
             	   let elem = card.querySelector('#statusQ');
            	   elem.parentNode.removeChild(elem);
                  }, 3000);                
            	
            	
            	clearTimeout();
            }
      
        }
    });//end of click event handler
    
    positionCardContainer.addEventListener('change', event => {

    	let positionId = event.target.parentElement.id;
    	let card = event.target.parentElement;

    	if (event.target.className === 'pickUpLocationSelector') {
    		let pickupLocation = event.target.parentElement.querySelector('.pickUpLocationSelector').value;
    		if (pickupLocation === 'empty') {
                removePickupLocation(positionId);
            	card.insertAdjacentHTML('beforeend', '<p id="statusF">Pickup location removed</p>');
            	setTimeout(() => {
              	   let elem = card.querySelector('#statusF');
             	   elem.parentNode.removeChild(elem);
                   }, 3000);        
            	clearTimeout();


    		} else {
    			updatePickupLocation(positionId, pickupLocation);
            	card.insertAdjacentHTML('beforeend', '<p id="statusG">Pickup location updated</p>');
            	setTimeout(() => {
               	   let elem = card.querySelector('#statusG');
              	   elem.parentNode.removeChild(elem);
                    }, 3000);        
             	clearTimeout();
    		}
    	}
    });    
    
});

function updateDisplayedPosition(positionId, checked) {
    let url = 'http://localhost:8080/capstone/api/updateDisplayedPosition/' + positionId + '/' + checked;
    // let data = { isDisplayed: checked };
    fetch(url, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => {})
        .then(data => {
            // console.table(data);
            // do something with the data
        })
        .catch(err => {
            console.error(err);
        });
}

function updatePickupLocation(positionId, pickupLocation) {
    let url = 'http://localhost:8080/capstone/api/updatePickUpLocation/' + positionId + '/' + pickupLocation;

    fetch(url, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => {})
        .then(data => {})
        .catch(err => {
            console.error(err);
        });
}

function removePickupLocation(positionId, pickupLocation) {
    let url = 'http://localhost:8080/capstone/api/removePickUpLocation/' + positionId;

    fetch(url, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => {})
        .then(data => {})
        .catch(err => {
            console.error(err);
        });
}

