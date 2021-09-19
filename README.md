# Dynamic shop page

In this repo I show you how I made a 100% dynamic single product pagewith the framework Laravel [See website](https://google.com "Go to website")

## Database structure

I store product,categories, and products images .
For much details go to this repo[Last Repo](https://google.com "Go to repository")

## How do I store products

I store product,categories, and products images .

1. Validate data from form
2. Store the path of the required image
3. Create a new instance of product and I fill it with the information from the form
4. I store facultative images using product id that I have just created
5. I add category to the product using category id retrieve via the form
6. After that the product is successfully created ,I return back with a flash data

### The controller code

```php
public function create(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required',
            'subtitle' => 'required',
            'description' => 'required',
            'rating' => 'required|numeric|min:1|max:5',
            'price' => 'required|numeric',
            'stock' => 'required|numeric',
            'image' => 'image|required',
        ]);
        //validate data from form
        $validated['slug'] = Str::slug($validated['name'], '-');
        // store path of required image
        $validated['image'] = $request->file('image')->store('avatars');
        // create new product and fill it
        $product=new Product();
        $product->category_id=$request->category;
        $product->name=$validated['name'];
        $product->slug=$validated['slug'];
        $product->subtitle=$validated['subtitle'];
        $product->description=$validated['description'];
        $product->rating=$validated['rating'];
        $product->price=$validated['price'];
        $product->stock=$validated['stock'];
        $product->image=$validated['image'];
        $product->save();
        $id = $product->id;
        //store facultative images
        if ($request->image_1) {
            $path1 = $request->file('image_1')->store('avatars');
            DB::table('product_imgs')->insert([
                ['product_id' => $id, 'image' => $path1]
            ]);
        }
        if ($request->image_2) {
            $path2 = $request->file('image_2')->store('avatars');
            DB::table('product_imgs')->insert([
                ['product_id' => $id, 'image' => $path2]
            ]);
        }
        //add category to the product

        $request->session()->flash('success', 'Product created with success!');
        return back();
    }
```

## How do I randomly display the product

1. I get the total number of products in the database
2. I take a random id between 1 and the total registration
3. Send the corresponding product to the view

### The controller code

```php
public function index()
    {
        $total=Product::all()->count();
        $id_pro=random_int(1,$total);
        $product=Product::where('id',$id_pro)->get();
        return view('shop',['product'=>$product]);
    }
```

