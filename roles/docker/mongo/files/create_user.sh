set -e

mongo <<EOF
use $MONGO_DEP_DATABASE

db.createUser({
  user: '$MONGO_DEP_USERNAME',
  pwd: '$MONGO_DEP_PASSWORD',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DEP_DATABASE'
  }]
})
EOF
