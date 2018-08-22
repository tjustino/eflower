# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

Store.create(name:    "Default Store",
             address: "8 Street Life Avenue\n1234 Here&There",
             phone:   "123456")

User.create(email:                 "admin@email.com",
            password:              "p@ssw0rd",
            password_confirmation: "p@ssw0rd",
            is_admin:              true)
