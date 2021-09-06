<%-- 
    Document   : customer
    Created on : Jul 24, 2019, 1:14:10 PM
    Author     : CIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer info</title>
        <script type="text/javascript">
            function validation()
            {
                var name = document.addcustomer.name.value;
                var city = document.addcustomer.city.value;
                var email = document.addcustomer.email.value;
                var phone = document.addcustomer.phone.value;
                var country = document.addcustomer.country.value;
                var address = document.addcustomer.address.value;
                var postalcode = document.addcustomer.postalcode.value;


                /* start validation for name */
                var namepattern = /^([a-z A-Z])+$/;
                if (name.trim() == '') {
                    alert('Enter name');
                    document.addcustomer.name.focus();
                    return false;
                } else if (!namepattern.test(name)) {
                    alert('Name Must be in character Format');
                    document.addcustomer.name.focus();
                    return false;
                } else if (name.length < 3) {
                    alert('Name should be minimum 3 character');
                    document.addcustomer.name.focus();
                    return false;
                }
                /* end validation for name */
                /* start validation for city */
                if (city.trim() == '') {
                    alert('Enter City');
                    document.addcustomer.city.focus();
                    return false;
                } else {
                    if (city.length < 2) {
                        alert('City should be minimum 2 character');
                        document.addcustomer.city.focus();
                        return false;
                    }
                }
                /* end validation for city */
                /* Start validation for Email */
                var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (email.trim() == '') {
                    alert('Enter Email');
                    document.addcustomer.email.focus();
                    return false;
                } else if (!emailpattern.test(email)) {
                    alert('Email Must be Email Format');
                    document.addcustomer.email.focus();
                    return false;
                }
                /* end validation for Email */
                /* Start validation for phone */
                var phonepattern = /^([0-9]{10})$/;
                if (phone.trim() == '') {
                    alert('Enter Phone');
                    document.addcustomer.phone.focus();
                    return false;
                } else if (phone.length < 10) {
                    alert(' Phone should be 10 character');
                    document.addcustomer.phone.focus();
                    return false;
                } else if (!phonepattern.test(phone)) {
                    alert('Phone Must be Number positive Digit');
                    document.addcustomer.phone.focus();
                    return false;
                }
                /* end validation for Phone */
                /* start validation for country */
                if (country.trim() == '') {
                    alert('Enter Country');
                    document.addcustomer.country.focus();
                    return false;
                } else {
                    if (name.length < 2) {
                        alert('country should be minimum 2 character');
                        document.addcustomer.country.focus();
                        return false;
                    }
                }
                /* end validation for country */
                /* start validation for address */
                if (address.trim() == '') {
                    alert('Enter Address');
                    document.addcustomer.address.focus();
                    return false;
                } else {
                    if (address.length < 2) {
                        alert('City should be minimum 2 character');
                        document.addcustomer.address.focus();
                        return false;
                    }
                }
                /* end validation for address */
                /* start validation for postal code */
                var postalpattern = /^([0-9])$/;
                if (postalcode.trim() == '') {
                    alert('Enter postal code');
                    document.addcustomer.postalcode.focus();
                    return false;

                } else
                {
                    if (!postalpattern.test(postalcode)) {
                        alert('postalcode Must be positive Digit');
                        document.addcustomer.postalcode.focus();
                        return false;
                    } else
                        (postalcode.length < 2)
                    {
                    alert(' postalcode should more than 2 character');
                    document.addcustomer.postalcode.focus();
                    return false;
                }
                /* end validation for postalcode */
            }
        </script>
    </head>
    <body>
        <form action="AddCustomer" onsubmit="return validation()" name="addcustomer">
            <label>Customer Name</label>
            <input type="text" name="name"> 
            <br>
            <label>City</label>
            <input type="text" name="city">
            <br>
            <label>Email</label>
            <input type="email" name="email">
            <br>
            <label>Phone</label>
            <input type="text" name="phone">
            <br>
            <label>Country</label>
            <input type="text" name="country">
            <br>
            <label>Address</label>
            <input type="text" name="address">
            <br>
            <label>Postal Code</label>
            <input type="text" name="postalcode">
            <br>
            <input type="submit" name="submit" value="AddCustomer">
        </form>
    </body>
</html>