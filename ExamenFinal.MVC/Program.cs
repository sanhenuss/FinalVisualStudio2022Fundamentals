using Microsoft.EntityFrameworkCore;
using ExamenFinal.Infraestructura.Datos;

var builder = WebApplication.CreateBuilder(args);

//Configurando el db context
builder.Services.AddDbContext<FinalDbContext>(
        options => options.UseSqlServer("Data Source=Sanhenuss\\SQLEXPRESS; Initial Catalog=dbFinal; Integrated Security=True ; TrustServerCertificate = True")
    );

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

//app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();