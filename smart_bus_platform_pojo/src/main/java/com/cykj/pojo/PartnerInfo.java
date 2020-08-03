package com.cykj.pojo;

public class PartnerInfo extends Partner{
   private String typeName;
   private String cityName;
   private String stateName;

   public String getTypeName() {
      return typeName;
   }

   public void setTypeName(String typeName) {
      this.typeName = typeName;
   }

   public String getCityName() {
      return cityName;
   }

   public void setCityName(String cityName) {
      this.cityName = cityName;
   }

   public String getStateName() {
      return stateName;
   }

   public void setStateName(String stateName) {
      this.stateName = stateName;
   }

   @Override
   public String toString() {
      return "PartnerInfo{" +
              "typeName='" + typeName + '\'' +
              ", cityName='" + cityName + '\'' +
              ", stateName='" + stateName + '\'' +
              '}';
   }
}

