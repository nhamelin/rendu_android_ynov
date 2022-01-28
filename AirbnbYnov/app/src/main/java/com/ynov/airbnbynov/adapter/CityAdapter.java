package com.ynov.airbnbynov.adapter;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.navigation.Navigation;
import androidx.recyclerview.widget.RecyclerView;

import com.ynov.airbnbynov.R;
import com.ynov.airbnbynov.bo.City;
import com.ynov.airbnbynov.databinding.RowLayoutCityBinding;

import java.util.ArrayList;

public class CityAdapter extends RecyclerView.Adapter<CityHolder> {

    ArrayList<City> cityArrayList;

    public CityAdapter() {
        cityArrayList = new ArrayList<>();
    }

    public void setCityArrayList(ArrayList<City> cityArrayList) {
        this.cityArrayList = cityArrayList;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public CityHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        RowLayoutCityBinding binding = DataBindingUtil.inflate(
                LayoutInflater.from(parent.getContext()),
                R.layout.row_layout_city,
                parent,
                false
        );
        return new CityHolder(binding);
    }

    @Override
    public void onBindViewHolder(@NonNull CityHolder holder, int position) {
        City city = cityArrayList.get(position);
        holder.itemView.setOnClickListener(
                (view)-> Navigation.findNavController(view).navigate(R.id.action_listCities_to_listHousing)
        );
        holder.binding.setCity(city);
    }

    @Override
    public int getItemCount() {
        return cityArrayList.size();
    }

}
