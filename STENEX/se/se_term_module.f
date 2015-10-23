
!------------------------------------------------------------------------!
!  The Community Multiscale Air Quality (CMAQ) system software is in     !
!  continuous development by various groups and is based on information  !
!  from these groups: Federal Government employees, contractors working  !
!  within a United States Government contract, and non-Federal sources   !
!  including research institutions.  These groups give the Government    !
!  permission to use, prepare derivative works of, and distribute copies !
!  of their work in the CMAQ system to the public and to permit others   !
!  to do so.  The United States Environmental Protection Agency          !
!  therefore grants similar permission to use the CMAQ system software,  !
!  but users are requested to provide copies of derivative works or      !
!  products designed to operate in the CMAQ system to the United States  !
!  Government without restrictions as to use by others.  Software        !
!  that is used with the CMAQ system but distributed under the GNU       !
!  General Public License or the GNU Lesser General Public License is    !
!  subject to their copyright restrictions.                              !
!------------------------------------------------------------------------!

C RCS file, release, date & time of last delta, author, state, [and locker]
C $Header: /project/work/rep/STENEX/src/se_snl/se_term_module.f,v 1.2 2006/02/15 14:45:31 yoj Exp $

C what(1) key, module and SID; SCCS file; date and time of last delta:
C %W% %P% %G% %U%

C --------------------------------------------------------------------------
C Purpose:
C
C   to terminate stenex library
C
C Revision history:
C
C   Orginal version: 11/30/00 by David Wong
C
C                    12/04/02 by David Wong
C                       -- made the routine more robust by checking 
C                          allocation first before any deallocate call
C --------------------------------------------------------------------------

        module se_term_module

          implicit none

          contains

	  subroutine se_term 

	  use se_pe_info_ext
	  use se_domain_info_ext
          use se_reconfig_grid_info_ext
          use se_subgrid_info_ext

  	  implicit none

          if (allocated(ranks)) then
             deallocate(ranks)
          end if

          if (allocated(se_gl_ind)) then
             deallocate (se_gl_ind)
          end if

          if (allocated(se_reconfig_grid_send_ind)) then
             deallocate (se_reconfig_grid_send_ind)
             deallocate (se_reconfig_grid_recv_ind)
          end if

          if (allocated(se_subgrid_send_ind)) then
             deallocate (se_subgrid_send_ind)
             deallocate (se_subgrid_recv_ind)
             deallocate (se_subgrid_send)
             deallocate (se_subgrid_recv)
             deallocate (se_subgrid_ind)
          end if

          return
          end subroutine se_term 

        end module se_term_module
