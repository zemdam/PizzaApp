## About
It is simple web app for ordering pizza for users and handling orders by workers. Uses Ruby on Rails and Postgresql.
<details>
<summary>Screenshots</summary>

![Pizza sizes page](https://i.imgur.com/EiPAiBF.png)
![Pizza size page](https://i.imgur.com/5AAiETi.png)
![Sign Up page](https://i.imgur.com/eH94OBg.png)
![Pizza orders page](https://i.imgur.com/2vkaPPR.png)

</details>

## Running

You need to have Docker and docker-compose installed. Then simply run the following command:
```
docker-compose up --build
```
If it was first run you also need to initialize database by:
```
docker exec -it {container_name} sh
```
Where ``{container_name}`` is name of container created from image ``pizzaapp_pizza_app``. It can be checked by command ```docker ps```. Then run in container shell:
```
rails db:setup
```

## Availability
By default app is available on port ```4000```. You can check running example on http://138.3.245.115:4000/.

## Example data
App already have some example data: pizza sizes, types etc. Which includes admin and user account to easily review the app.
#### admin account
login: `admin@pizza.com`\
password: `admin12`
#### user account
login: `user@pizza.com`\
password: `user12`