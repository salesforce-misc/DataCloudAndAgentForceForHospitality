/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-27-2025
 * @last modified by  : Aman Patil
**/
public with sharing class clsLoyaltyController {
    @AuraEnabled(cacheable=true)
    public static LoyaltyProgramMember getLoyaltyData(String contactId){
        // Ensure that you fetch related records via proper SOQL relationships
        List<LoyaltyProgramMember> loyaltyData = [
            SELECT id, Contactid, EnrollmentDate, MemberStatus, MembershipNumber,
            (SELECT id, PointsBalance,TotalPointsAccrued FROM Loyalty_Member_Currency Order By CreatedDate DESC LIMIT 1),
            (SELECT id, Name FROM Loyalty_Member_Tier LIMIT 1)
            FROM LoyaltyProgramMember
            WHERE Contactid = :contactId 
            
        ];
        if(loyaltyData != null && loyaltyData.size() > 0){
            for(LoyaltyProgramMember lp:loyaltyData){
                system.debug(lp.Loyalty_Member_Tier.get(0).Name);
                //system.debug(lp.Loyalty_Member_Currency.get(0).PointsBalance);
                //system.debug(lp.Loyalty_Member_Currency);
               // system.debug(lp.Loyalty_Member_Tier);
                
                if(!lp.Loyalty_Member_Currency.isEmpty()  && !lp.Loyalty_Member_Tier.isEmpty() 
                   && lp.Loyalty_Member_Currency.get(0).PointsBalance >= 0 && lp.Loyalty_Member_Tier.get(0).Name!=null){
                       System.debug(lp.Loyalty_Member_Currency);
                       System.debug(lp.Loyalty_Member_Tier);
                       return lp;
                   }else{
                    return lp;
                   }
            } 
        }

        return null;
    }

   /*  @AuraEnabled(cacheable=true)
    public static LoyaltyProgramMember getLoyaltyRewards(String contactId){
        // Ensure that you fetch related records via proper SOQL relationships
        LoyaltyProgramMember loyaltyData = [
            SELECT id, Contactid, EnrollmentDate, MemberStatus, MembershipNumber,
            (SELECT id, PointsBalance,TotalPointsAccrued FROM Loyalty_Member_Currency Order By CreatedDate DESC LIMIT 1),
            (SELECT id, Name FROM Loyalty_Member_Tier LIMIT 1)
            FROM LoyaltyProgramMember
            WHERE Contactid = :contactId limit 1 ];

        if(loyaltyData != null){
            
                       return loyaltyData;
                   
            
        }

        return null;
    }
*/

}