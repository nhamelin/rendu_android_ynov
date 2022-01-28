package com.ynov.airbnbynov.adapter;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.ynov.airbnbynov.databinding.RowLayoutCityBinding;

public class CityHolder extends RecyclerView.ViewHolder {

    RowLayoutCityBinding binding;

    public CityHolder(@NonNull RowLayoutCityBinding binding) {
        super(binding.getRoot());
        this.binding = binding;
    }

}
