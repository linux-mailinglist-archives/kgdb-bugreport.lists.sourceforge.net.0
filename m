Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F932188E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Feb 2021 14:26:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEBEh-0002DV-AL
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Feb 2021 13:26:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEBEg-0002DH-IQ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 13:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apxYDQCI+SOD/kqNy/5jU+MenWzPtcKmolRT8QMiKI0=; b=NAvZ2GPbIucvdrkzw0xB+Bl5F9
 pqgzuUvB0WCgVlKA+V3s0hGQ+Sqhq2AUa4h7qYKrrhqMMlYDc3JYvxykYxs+Mo77WpBvEtuc9aDgq
 0ItIUnBP5WE4HCr6QNayrXP63yZsg7aV+eiX5maBBgk95S77EQDQX0TQOVfCZWnG24Sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=apxYDQCI+SOD/kqNy/5jU+MenWzPtcKmolRT8QMiKI0=; b=jqRbAIa5ndujod2Yehn6DTDGa+
 VtzJkQ11wXfxFWonlCMsSDBlF13oO7FeuZsaWTVmLEuBOdjVCRVD16TF0GEEJkK/Y/WNqOMCPmDNp
 MdNDRDeppkIVGYZ6WabiKIUAZxLxHzbUSls8ZSu57X8Kh5+MDGrTffGsmTroMkpRzeaI=;
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEBEV-0006h2-0k
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Feb 2021 13:26:50 +0000
Received: by mail-lj1-f175.google.com with SMTP id e8so19036272ljj.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Feb 2021 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=apxYDQCI+SOD/kqNy/5jU+MenWzPtcKmolRT8QMiKI0=;
 b=WXXjDvEV3KZMLjnIQlY1spbzGP87VQPy1H2pOU5YAB/qAamH6juFzJ0PplPffQ7jbn
 HT8Mwwej6FTF0fUolExl6+8Q440MAsdwNiJQGhG/quaD/DIyiJpH8kHb68IYXSEgS2LC
 idxU013PLvIDvrP8171RV5ATR3jwhhYXbC4ORGAobfXKVM3DyMTpn125vBi6rTiNYNKE
 vUR+YR/MJFMX6TuMYCByKKL2aKaT92CeyWAF8P5D+rUnofp3/nmsaZ/LeIXc1XTSOGaN
 0vTLCKjXyNkOWKa+vWUxKGGAOGxA/Xz5I6yZjTmaWL2pEUtnUiw9ukR7FSQk+EmxhzRr
 y/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apxYDQCI+SOD/kqNy/5jU+MenWzPtcKmolRT8QMiKI0=;
 b=Vu8WWhz9fSoiuGpisTF+dFv8KUDwyOI7U84nHh6i9ZonKjpBN4eWisAMlt6VOguSph
 VLY9Jl9z+zgxtknpTW7NqaIUjn6cbHFAvS32sKcHUoIvNTlVsBCV3v2BTdRCukfDd/uy
 hyqAGP25sYm4ZHXFpQiNLslq4ITaG/TB2Eky3JIiFmPBEliI33t2lVKSD35dFLGsixfB
 ko7cBkVA/66aVcrGfZjDkifWgsCaCDGNNRoLwXbWho3JpLlh7AhBpTBq50Q3qQSjs8s/
 JbR+kZInMoL1BJxqw2yNKCtyYmaWqiHbOBrtsLKYL44fMrHFqJr/lxeaSCJkrPP/romt
 6+rw==
X-Gm-Message-State: AOAM531iK801iHC+QbxxBWYQ0xQwEtYXAr8mooUXFq0bpuAkG/lq1zwC
 0HkopL8EPJJo99BfoiBi9y0blbPLKTTwz7qp7Xy2iKnlyZs=
X-Google-Smtp-Source: ABdhPJwzBm0Wckruod2o1Aa4zmDX6AgnqFywE8Heonz6dwsWmdNOFwgwIpXoeVv70BRPAQlXq0j49cCMn25nd06Pmns=
X-Received: by 2002:ac2:5295:: with SMTP id q21mr11362188lfm.108.1613999009790; 
 Mon, 22 Feb 2021 05:03:29 -0800 (PST)
MIME-Version: 1.0
References: <1613650198-27437-1-git-send-email-sumit.garg@linaro.org>
 <20210222120502.phazkmskgqvpe4yy@maple.lan>
In-Reply-To: <20210222120502.phazkmskgqvpe4yy@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 22 Feb 2021 18:33:18 +0530
Message-ID: <CAFA6WYNiaeyFHrcTSp6x4ur5VjZAoJ=NfMPsa__dH2VK9ze7vQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEBEV-0006h2-0k
Subject: Re: [Kgdb-bugreport] [PATCH v4] kdb: Simplify kdb commands
 registration
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 22 Feb 2021 at 17:35, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Feb 18, 2021 at 05:39:58PM +0530, Sumit Garg wrote:
> > Simplify kdb commands registration via using linked list instead of
> > static array for commands storage.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >
> > Changes in v4:
> > - Fix kdb commands memory allocation issue prior to slab being available
> >   with an array of statically allocated commands. Now it works fine with
> >   kgdbwait.
>
> I'm not sure this is the right approach. It's still faking dynamic usage
> when none of the callers at this stage of the boot actually are dynamic.
>

Okay, as an alternative I came across dbg_kmalloc()/dbg_kfree() as well but ...

> Consider instead what would happen if there was a kdb_register_table() that
> took a kdbtab_t pointer and an length and enqueued them to the new list.
>
> The effect of this is that most of the existing kdb_register() and
> kdb_register_flags() calls would become (self documenting) static
> tables instead:
>
> kdb_register_flags("md", kdb_md, "<vaddr>",
>           "Display Memory Contents, also mdWcN, e.g. md8c1", 1,
>                   KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS);
> ...
>
> Effectively becomes:
>
> kdbtab_t maintab[] = {
>         { .cmd_name = "md",
>           .cmd_func = mdb_md,
>           .cmd_usage = "<vaddr">,
>           .cmd_help = "Display Memory Contents, also mdWcN, e.g. md8c1",
>           .cmd_minlen = 1,
>           .cmd_flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
>         },
>         ...
> };
>
> kdb_register_table(maintab, ARRAY_SIZE(maintab));
>

... this approach sounds more appropriate since these commands look
static in nature.

> At that point the only users of kdb_register_flags() would be the macro
> logic and that already relies on the slabs so it is OK to have dynamic
> memory allocation for that.

Makes sense, will use this approach instead.

>
> Daniel.
>
>
> PS It is also possible to switch the macro logic to simplify the
>    allocation by embedded a kdbtab_t into struct defcmd_set. That
>    would also even more tidy up of registration code... but that
>    could (and should) be in another patch so it doesn't all
>    have to land together.
>

Okay.

-Sumit

>
> > - Fix a misc checkpatch warning.
> > - I have dropped Doug's review tag as I think this version includes a
> >   major fix that should be reviewed again.
> >
> > Changes in v3:
> > - Remove redundant "if" check.
> > - Pick up review tag from Doug.
> >
> > Changes in v2:
> > - Remove redundant NULL check for "cmd_name".
> > - Incorporate misc. comment.
> >
> >  kernel/debug/kdb/kdb_main.c    | 129 ++++++++++++++---------------------------
> >  kernel/debug/kdb/kdb_private.h |   2 +
> >  2 files changed, 47 insertions(+), 84 deletions(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 930ac1b..5215e04 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/kallsyms.h>
> >  #include <linux/kgdb.h>
> >  #include <linux/kdb.h>
> > +#include <linux/list.h>
> >  #include <linux/notifier.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/delay.h>
> > @@ -84,15 +85,12 @@ static unsigned int kdb_continue_catastrophic =
> >  static unsigned int kdb_continue_catastrophic;
> >  #endif
> >
> > -/* kdb_commands describes the available commands. */
> > -static kdbtab_t *kdb_commands;
> > -#define KDB_BASE_CMD_MAX 50
> > -static int kdb_max_commands = KDB_BASE_CMD_MAX;
> > -static kdbtab_t kdb_base_commands[KDB_BASE_CMD_MAX];
> > -#define for_each_kdbcmd(cmd, num)                                    \
> > -     for ((cmd) = kdb_base_commands, (num) = 0;                      \
> > -          num < kdb_max_commands;                                    \
> > -          num++, num == KDB_BASE_CMD_MAX ? cmd = kdb_commands : cmd++)
> > +/* kdb_cmds_head describes the available commands. */
> > +static LIST_HEAD(kdb_cmds_head);
> > +
> > +#define KDB_CMD_INIT_MAX     50
> > +static int kdb_cmd_init_idx;
> > +static kdbtab_t kdb_commands_init[KDB_CMD_INIT_MAX];
> >
> >  typedef struct _kdbmsg {
> >       int     km_diag;        /* kdb diagnostic */
> > @@ -921,7 +919,7 @@ int kdb_parse(const char *cmdstr)
> >       char *cp;
> >       char *cpp, quoted;
> >       kdbtab_t *tp;
> > -     int i, escaped, ignore_errors = 0, check_grep = 0;
> > +     int escaped, ignore_errors = 0, check_grep = 0;
> >
> >       /*
> >        * First tokenize the command string.
> > @@ -1011,25 +1009,17 @@ int kdb_parse(const char *cmdstr)
> >               ++argv[0];
> >       }
> >
> > -     for_each_kdbcmd(tp, i) {
> > -             if (tp->cmd_name) {
> > -                     /*
> > -                      * If this command is allowed to be abbreviated,
> > -                      * check to see if this is it.
> > -                      */
> > -
> > -                     if (tp->cmd_minlen
> > -                      && (strlen(argv[0]) <= tp->cmd_minlen)) {
> > -                             if (strncmp(argv[0],
> > -                                         tp->cmd_name,
> > -                                         tp->cmd_minlen) == 0) {
> > -                                     break;
> > -                             }
> > -                     }
> > +     list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > +             /*
> > +              * If this command is allowed to be abbreviated,
> > +              * check to see if this is it.
> > +              */
> > +             if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
> > +                 (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
> > +                     break;
> >
> > -                     if (strcmp(argv[0], tp->cmd_name) == 0)
> > -                             break;
> > -             }
> > +             if (strcmp(argv[0], tp->cmd_name) == 0)
> > +                     break;
> >       }
> >
> >       /*
> > @@ -1037,19 +1027,15 @@ int kdb_parse(const char *cmdstr)
> >        * few characters of this match any of the known commands.
> >        * e.g., md1c20 should match md.
> >        */
> > -     if (i == kdb_max_commands) {
> > -             for_each_kdbcmd(tp, i) {
> > -                     if (tp->cmd_name) {
> > -                             if (strncmp(argv[0],
> > -                                         tp->cmd_name,
> > -                                         strlen(tp->cmd_name)) == 0) {
> > -                                     break;
> > -                             }
> > -                     }
> > +     if (list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
> > +             list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> > +                     if (strncmp(argv[0], tp->cmd_name,
> > +                                 strlen(tp->cmd_name)) == 0)
> > +                             break;
> >               }
> >       }
> >
> > -     if (i < kdb_max_commands) {
> > +     if (!list_entry_is_head(tp, &kdb_cmds_head, list_node)) {
> >               int result;
> >
> >               if (!kdb_check_flags(tp->cmd_flags, kdb_cmd_enabled, argc <= 1))
> > @@ -2428,17 +2414,14 @@ static int kdb_kgdb(int argc, const char **argv)
> >  static int kdb_help(int argc, const char **argv)
> >  {
> >       kdbtab_t *kt;
> > -     int i;
> >
> >       kdb_printf("%-15.15s %-20.20s %s\n", "Command", "Usage", "Description");
> >       kdb_printf("-----------------------------"
> >                  "-----------------------------\n");
> > -     for_each_kdbcmd(kt, i) {
> > +     list_for_each_entry(kt, &kdb_cmds_head, list_node) {
> >               char *space = "";
> >               if (KDB_FLAG(CMD_INTERRUPT))
> >                       return 0;
> > -             if (!kt->cmd_name)
> > -                     continue;
> >               if (!kdb_check_flags(kt->cmd_flags, kdb_cmd_enabled, true))
> >                       continue;
> >               if (strlen(kt->cmd_usage) > 20)
> > @@ -2667,49 +2650,30 @@ int kdb_register_flags(char *cmd,
> >                      short minlen,
> >                      kdb_cmdflags_t flags)
> >  {
> > -     int i;
> >       kdbtab_t *kp;
> >
> > -     /*
> > -      *  Brute force method to determine duplicates
> > -      */
> > -     for_each_kdbcmd(kp, i) {
> > -             if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
> > +     list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> > +             if (strcmp(kp->cmd_name, cmd) == 0) {
> >                       kdb_printf("Duplicate kdb command registered: "
> >                               "%s, func %px help %s\n", cmd, func, help);
> >                       return 1;
> >               }
> >       }
> >
> > -     /*
> > -      * Insert command into first available location in table
> > -      */
> > -     for_each_kdbcmd(kp, i) {
> > -             if (kp->cmd_name == NULL)
> > -                     break;
> > -     }
> > -
> > -     if (i >= kdb_max_commands) {
> > -             kdbtab_t *new = kmalloc_array(kdb_max_commands -
> > -                                             KDB_BASE_CMD_MAX +
> > -                                             kdb_command_extend,
> > -                                           sizeof(*new),
> > -                                           GFP_KDB);
> > -             if (!new) {
> > -                     kdb_printf("Could not allocate new kdb_command "
> > -                                "table\n");
> > +     if (slab_is_available()) {
> > +             kp = kmalloc(sizeof(*kp), GFP_KDB);
> > +             if (!kp) {
> > +                     kdb_printf("Could not allocate new kdb_command table\n");
> >                       return 1;
> >               }
> > -             if (kdb_commands) {
> > -                     memcpy(new, kdb_commands,
> > -                       (kdb_max_commands - KDB_BASE_CMD_MAX) * sizeof(*new));
> > -                     kfree(kdb_commands);
> > +             kp->is_dynamic = true;
> > +     } else {
> > +             if (kdb_cmd_init_idx >= KDB_CMD_INIT_MAX) {
> > +                     kdb_printf("Could not allocate init kdb_command table\n");
> > +                     return 1;
> >               }
> > -             memset(new + kdb_max_commands - KDB_BASE_CMD_MAX, 0,
> > -                    kdb_command_extend * sizeof(*new));
> > -             kdb_commands = new;
> > -             kp = kdb_commands + kdb_max_commands - KDB_BASE_CMD_MAX;
> > -             kdb_max_commands += kdb_command_extend;
> > +             kp = &kdb_commands_init[kdb_cmd_init_idx];
> > +             kdb_cmd_init_idx++;
> >       }
> >
> >       kp->cmd_name   = cmd;
> > @@ -2719,6 +2683,8 @@ int kdb_register_flags(char *cmd,
> >       kp->cmd_minlen = minlen;
> >       kp->cmd_flags  = flags;
> >
> > +     list_add_tail(&kp->list_node, &kdb_cmds_head);
> > +
> >       return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(kdb_register_flags);
> > @@ -2757,15 +2723,16 @@ EXPORT_SYMBOL_GPL(kdb_register);
> >   */
> >  int kdb_unregister(char *cmd)
> >  {
> > -     int i;
> >       kdbtab_t *kp;
> >
> >       /*
> >        *  find the command.
> >        */
> > -     for_each_kdbcmd(kp, i) {
> > -             if (kp->cmd_name && (strcmp(kp->cmd_name, cmd) == 0)) {
> > -                     kp->cmd_name = NULL;
> > +     list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> > +             if (strcmp(kp->cmd_name, cmd) == 0) {
> > +                     list_del(&kp->list_node);
> > +                     if (kp->is_dynamic)
> > +                             kfree(kp);
> >                       return 0;
> >               }
> >       }
> > @@ -2778,12 +2745,6 @@ EXPORT_SYMBOL_GPL(kdb_unregister);
> >  /* Initialize the kdb command table. */
> >  static void __init kdb_inittab(void)
> >  {
> > -     int i;
> > -     kdbtab_t *kp;
> > -
> > -     for_each_kdbcmd(kp, i)
> > -             kp->cmd_name = NULL;
> > -
> >       kdb_register_flags("md", kdb_md, "<vaddr>",
> >         "Display Memory Contents, also mdWcN, e.g. md8c1", 1,
> >         KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS);
> > diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> > index a4281fb..f969a6a 100644
> > --- a/kernel/debug/kdb/kdb_private.h
> > +++ b/kernel/debug/kdb/kdb_private.h
> > @@ -174,6 +174,8 @@ typedef struct _kdbtab {
> >       short    cmd_minlen;            /* Minimum legal # command
> >                                        * chars required */
> >       kdb_cmdflags_t cmd_flags;       /* Command behaviour flags */
> > +     struct list_head list_node;     /* Command list */
> > +     bool    is_dynamic;             /* Command table allocation type */
> >  } kdbtab_t;
> >
> >  extern int kdb_bt(int, const char **);       /* KDB display back trace */
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
