import places from 'places.js';

const initAutocomplete = () => {
  const jobAddressInput = document.getElementById('job_location');
  const userAddressInput = document.getElementById('user_address');
  if (jobAddressInput) {
    places({ container: jobAddressInput });
  }

  if (userAddressInput) {
    places({ container: userAddressInput });
  }

};

export { initAutocomplete };
