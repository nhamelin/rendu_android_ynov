package com.ynov.airbnbynov.viewmodel;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import com.ynov.airbnbynov.bo.City;
import com.ynov.airbnbynov.bo.Housing;

import java.util.ArrayList;

public class ListHousingFragmentViewModel extends ViewModel {

    MutableLiveData<ArrayList<Housing>> arrayListHousing;

    public MutableLiveData<ArrayList<Housing>> getArrayListHousing() {

        if(arrayListHousing == null) {
            this.arrayListHousing = new MutableLiveData<>(new ArrayList<>());
        }

        return this.arrayListHousing;
    }

}
