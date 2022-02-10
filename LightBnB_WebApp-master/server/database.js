const properties = require('./json/properties.json');
const users = require('./json/users.json');
const {Pool} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const getUserWithEmail = function(email) {
  return pool
  .query(`SELECT * FROM users WHERE email = $1`,[email])
  .then(user => {return Promise.resolve(user.rows[0])})
  .catch((err) => {
    console.log(err.message);
  });
};

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
    return pool
    .query(`SELECT * FROM users WHERE id = $1`,[id])
    .then(user => {return Promise.resolve(user.rows[0])})
    .catch((err) => {
      console.log(err.message);
    });
}

exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const addUserQuery = `
  INSERT INTO users(name, password, email) 
  VALUES ($1,$2,$3) RETURNING *`
  const values = [user.name, user.password, user.email]
  return pool
    .query(addUserQuery, values)
    .then(newUser => {return Promise.resolve(newUser.rows)})
    .catch((err) => {
      console.log(err.message);
    });
};

exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  const queryString = `
  SELECT properties.* ,reservations.start_date, reservations.end_date FROM properties 
  JOIN reservations ON property_id = properties.id
  WHERE reservations.guest_id = $1
  LIMIT $2`
  return pool
    .query(queryString,[guest_id, limit])
    .then(data=>{return Promise.resolve(data.rows)})
    .catch((err) => {
      console.log(err.message);
    });
}

exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

const getAllProperties = (options, limit = 10) => {
  console.log(options);
  const {
    city,
    owner_id,
    minimum_price_per_night,
    maximum_price_per_night,
    minimum_rating
  } = options;
  
  const queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  WHERE true
  `;

  if (owner_id) {
    queryParams.push(`${owner_id}`);
    queryString += `
    AND owner_id = $${queryParams.length}`;
  }
  if (city) {
    queryParams.push(`%${city}%`);
    queryString += `
    AND city LIKE $${queryParams.length}`;
  }
  if (minimum_price_per_night) {
    queryParams.push(`${minimum_price_per_night}`);
    queryString += `
    AND cost_per_night > $${queryParams.length}`;
  }
  if (maximum_price_per_night) {
    queryParams.push(`${maximum_price_per_night}`);
    queryString += `
    AND cost_per_night < $${queryParams.length}`;
  }
  queryString += `
  GROUP BY properties.id
  `
  if (minimum_rating) {
    queryParams.push(`${minimum_rating}`);
    queryString += `
    HAVING avg(property_reviews.rating) > $${queryParams.length} `;
  }

  // 4
  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  // 5
  console.log(queryString, queryParams);

  // 6
  return pool.query(queryString, queryParams).then((res) => {return Promise.resolve(res.rows)});
};

  
exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;



