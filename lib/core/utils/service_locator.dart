import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_app/core/theme/theme_cubit.dart';
import 'package:ticket_app/features/tickets/data/datasources/database.dart';
import 'package:ticket_app/features/tickets/data/datasources/tickets_local_data_source.dart';
import 'package:ticket_app/features/tickets/data/repositories/ticket_repository_impl.dart';
import 'package:ticket_app/features/tickets/domain/repositories/ticket_repository.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/search_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  final database = await openTicketsDatabase();
  sl.registerSingleton<Database>(database);

  // Data sources
  sl.registerLazySingleton<TicketsLocalDataSource>(
    () => TicketsLocalDataSourceImpl(database: sl<Database>()),
  );

  // Repositories
  sl.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(ticketsLocalDataSource: sl<TicketsLocalDataSource>()),
  );

  // Cubits
  sl.registerLazySingleton<TicketCubit>(
    () => TicketCubit(ticketRepository: sl<TicketRepository>()),
  );

  sl.registerFactory<SearchCubit>(
    () => SearchCubit(ticketRepository: sl<TicketRepository>()),
  );

  sl.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(prefs: sl<SharedPreferences>()),
  );
}
