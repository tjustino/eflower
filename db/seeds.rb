# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).

Product.delete_all

Product.create!(name: "Orchidée",
                description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " \
                  "Curabitur condimentum ipsum nunc, nec varius sem molestie " \
                  "in. Nulla facilisi. Praesent id neque leo. Interdum et " \
                  "malesuada fames ac ante ipsum primis in faucibus. Etiam " \
                  "lacinia enim id orci sagittis, sed viverra dolor dapibus.",
                image_url: "original_1.jpg",
                price: 26.00)

Product.create!(name: "Bonsaï",
                description:
                  "Vestibulum dapibus nunc eu elit laoreet, sit amet efficit " \
                  "erat dictum. Cras gravida turpis et lorem bibendum, a " \
                  "dapibus arcu fringilla. Fusce ut nisl diam. Quisque sit " \
                  "amet ligula ante. Vivamus ac ultrices elit, in semper " \
                  "neque. Fusce tempor efficitur eros, nec ultrices neque " \
                  "pharetra et.",
                image_url: "original_2.jpg",
                price: 34.90)

Product.create!(name: "Citronnier",
                description:
                  "In a erat vitae lacus venenatis tincidunt id et felis. " \
                  "Vivamus eros ipsum, congue sed ligula cursus, volutpat " \
                  "porttitor tellus. Mauris lobortis libero sapien convallis " \
                  "fringilla. Integer ut nulla rutrum, imperdiet erat non, " \
                  "bibendum erat.",
                image_url: "original_3.jpg",
                price: 55.45)
