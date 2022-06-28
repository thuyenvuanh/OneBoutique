/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessionbeans;

import entities.Account;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author SE161502 Vu Anh Thuyen
 */
@Stateless
public class AccountFacade extends AbstractFacade<Account> {

    @PersistenceContext(unitName = "OneBoutiquePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountFacade() {
        super(Account.class);
    }

    public Account getAccount(String email, String password) {
        try {
            Account user = (Account) em.createNamedQuery("Account.findByEmail").setParameter("email", email).getSingleResult();
            if (user == null) {
                return null;
            }
            if (!user.getPassword().equals(password)) {
                return null;
            }
            return user;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean isEmailExist (String email) {
        try {
            Account user = (Account) em.createNamedQuery("Account.findByEmail").setParameter("email", email).getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean isUsernameExist(String username){
        try {
            Account user = (Account) em.createNamedQuery("Account.findByUserName").setParameter("userName", username).getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean isPhoneExist(String phone){
        try {
            Account user = (Account) em.createNamedQuery("Account.findByPhone").setParameter("phone", phone).getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
