import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/core/theme/app_theme_colors.dart';
import 'package:ticket_app/core/widgets/success_dialog.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_cubit.dart';
import 'package:ticket_app/features/tickets/presentation/cubit/ticket_state.dart';
import 'package:ticket_app/features/tickets/presentation/widgets/create_ticket_view_body.dart';

class CreateTicketView extends StatelessWidget {
  const CreateTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text('Create Ticket'),
      ),
      body: CreateTicketBlocConsumer(),
    );
  }
}

class CreateTicketBlocConsumer extends StatelessWidget {
  const CreateTicketBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketCubit, TicketState>(
      listenWhen: (previous, current) =>
          current is TicketCreated || current is TicketError,
      listener: (context, state) async {
        if (state is TicketCreated) {
          await SuccessDialog.show(
            context,
            title: 'Ticket Created!',
            message:
                'Your ticket has been submitted successfully. We\'ll get back to you soon.',
            buttonText: 'Great!',
          );
          if (context.mounted) {
            GoRouter.of(context).pop();
          }
        } else if (state is TicketError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return CreateTicketViewBody(isSubmitting: state is TicketLoading);
      },
    );
  }
}
