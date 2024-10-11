<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProdukResource\Pages;
use App\Filament\Resources\ProdukResource\RelationManagers;
use App\Models\Produk;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\Kategori;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextArea;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;

class ProdukResource extends Resource
{
    protected static ?string $model = Produk::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('nama_produk')->required(),
                Select::make('kategori_id')->label('Kategori')->options(Kategori::all()->pluck('nama_kategori','id')),
                TextInput::make('harga')->required(),
                TextInput::make('stok')->required(),
                TextArea::make('deskripsi')->required(),
                FileUpload::make('foto_produk')->required()->image(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('kategori.nama_kategori')
                ->label('Kategori')->sortable(),
                TextColumn::make('harga')->sortable(),
                Tables\Columns\TextInputColumn::make('stok')
                ->label('Stok')->rules(['numeric'])
                ->sortable(),// Menentukan input numerikl
                TextColumn::make('deskripsi')->sortable()->limit(50),
                ImageColumn::make('foto_produk')->sortable()
                ->disk('public'),
                Tables\Columns\ToggleColumn::make('is_active')
                ->label('Aktif')
                ->sortable()
                ->onColor('success')
                ->offColor('danger'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProduks::route('/'),
            'create' => Pages\CreateProduk::route('/create'),
            'edit' => Pages\EditProduk::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
{
    return parent::getEloquentQuery()
        ->withoutGlobalScopes([
            SoftDeletingScope::class,
        ]);
}
}
