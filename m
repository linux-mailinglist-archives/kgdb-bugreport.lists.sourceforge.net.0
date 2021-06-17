Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B003AB304
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Jun 2021 13:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ltqX8-00032s-1o
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Jun 2021 11:50:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1ltqX6-00032W-2f
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLdnBS3/dMYpM0MzJojq+Qr8igbFfpUegrZec+ITJnk=; b=H/nZL8v2rwEtUyUC6/efSUHDgQ
 jjVsqau+jYzS5eI1Rnv7D0mbuFRrHvEbaYodlZA+kj4+PW4wOtIdqi4PzAeW9fHlM0NHGPzYREFlu
 6AQ9WHuTGC5chtAjbvairyrDyueAFww4gw1upegy1dM/nE7y1xH3IBW2y+ud7YA5Xu7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WLdnBS3/dMYpM0MzJojq+Qr8igbFfpUegrZec+ITJnk=; b=JrOlpHJjsu2njFp6boyRr16hLU
 QE2S2/6iulV2wTFwwgHHTb0FmyVsMwCkX+dUVflb0qPX64BDUCimsgfZPAhRAVBt96ebAVqFK7zIN
 lDqBY2Car+KZV57rFgmnaIzw8SaeE21qTx9pRBhcJcRrcGNjnh+7VmoiW8q+n5AI0xT0=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltqWz-00Dg12-N5
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Jun 2021 11:50:05 +0000
Received: by mail-lj1-f170.google.com with SMTP id l4so8657697ljg.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Jun 2021 04:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WLdnBS3/dMYpM0MzJojq+Qr8igbFfpUegrZec+ITJnk=;
 b=KSwyHjyfZuo2Pw5fuxC8MoU5cgdwys0TmaVdDX6XQhzK14fXq4WajkLMSXWoYtYuxH
 BPC7WlRj3RiwS1bQDIXSVmlHye3ONqavouOyAS0vh/ETYZ1dCdYCtis5YkUc1a6iGPYP
 UkEm40i1Yt8icpwt9vrLmjno9ll8TJj5E7Po+hxpVA+ywF6PIbCqgjGljp39C5SwyYqz
 y9BrO5lq+dvl4SFafYtFTTYV/2qxeHUJ8UCvigM+brc+j9DvJS9wGnu14b7CxZw3yDT9
 +QS8FUXlDa9EbORwSM5Ce3cFacC72ui/lya10wWU9cgaV2/GYoeS5KZUZQxfwK5SlYuN
 5oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLdnBS3/dMYpM0MzJojq+Qr8igbFfpUegrZec+ITJnk=;
 b=oCmqBXJ/OsSgLkbkVO8q0r5ZNpwON288cCNniP8ZzfmLBedAGmwC1/N+nApYVCquNx
 VLVAtWpe1ojurJyZm5JMQ2yODPVDIwsWuMKVT0v2JTty96H30YD3pHT++T7pZv+uXl54
 b9DjrXeeGYgR0ZnsAld0R/rjFVT+AfNrRCyLkyAyUy+8m/3IJ51GEqOAlSoyfHAsT1C3
 6GsA9IqXyOIHPZdv35hnf7jiLn6Unvvl4RvuYkgWEf7xEeNjfHCjqQaRfPcddZ7vULRH
 GdXfRihahWA4LGmmDnab4VSlCfkOecsL3Z2FRbR3nCBi0vwR+GKa1wPvZlNx2+Q9GYTG
 JozQ==
X-Gm-Message-State: AOAM531ZwvZ2AY0UnKp5GO9M4uEjCirKQYm5FagsuBrlofkK6PWvcWzU
 iXZCrO1l8PL8RF9nyS3/nNkXdu9kUGrklKLiKwLHQQ==
X-Google-Smtp-Source: ABdhPJwVK++t8qnfPu5Q2ShV+uQ0bah2aDCyLQVeAZbGq2zgdzpW1PybYg9gMAwM4MCVh2P7S0LUy2+3GM1pBb6BPp0=
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr4428472ljn.314.1623930591032; 
 Thu, 17 Jun 2021 04:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210513112842.707103-1-sumit.garg@linaro.org>
 <20210513112842.707103-2-sumit.garg@linaro.org>
 <CAD=FV=UkQoUFzYa3OKPSwQo51V09-EXTdp=GNo=H+ZMcjX-ovw@mail.gmail.com>
In-Reply-To: <CAD=FV=UkQoUFzYa3OKPSwQo51V09-EXTdp=GNo=H+ZMcjX-ovw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 17 Jun 2021 17:19:39 +0530
Message-ID: <CAFA6WYP6X+VRY=A6DBYcRUDVAFZT=FwmzB_Dc0XMjtsNNoa3jQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.170 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltqWz-00Dg12-N5
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/2] kdb: Get rid of redundant
 kdb_register_flags()
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

Thanks for your comments on this series and apologies for my delayed
reply as I was busy with other high priority stuff. So I will
incorporate your comments in the next version.

-Sumit

On Thu, 20 May 2021 at 22:51, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 13, 2021 at 4:29 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Commit e4f291b3f7bb ("kdb: Simplify kdb commands registration")
> > allowed registration of pre-allocated kdb commands with pointer to
> > struct kdbtab_t. Lets switch other users as well to register pre-
> > allocated kdb commands via:
> > - Changing prototype for kdb_register() to pass a pointer to struct
> >   kdbtab_t instead.
> > - Embed kdbtab_t structure in defcmd_set rather than individual params.
> >   So while at it rename struct defcmd_set to struct kdb_macro_t as that
> >   sounds more appropriate given its purpose.
> >
> > With these changes kdb_register_flags() becomes redundant and hence
> > removed. Also, since we have switched all users to register
> > pre-allocated commands, "is_dynamic" flag in struct kdbtab_t becomes
> > redundant and hence removed as well.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  include/linux/kdb.h            |  27 +++--
> >  kernel/debug/kdb/kdb_main.c    | 206 +++++++++++----------------------
> >  kernel/debug/kdb/kdb_private.h |  13 ---
> >  kernel/trace/trace_kdb.c       |  12 +-
> >  samples/kdb/kdb_hello.c        |  20 ++--
> >  5 files changed, 104 insertions(+), 174 deletions(-)
> >
> > diff --git a/include/linux/kdb.h b/include/linux/kdb.h
> > index 0125a677b67f..9e893279b2ea 100644
> > --- a/include/linux/kdb.h
> > +++ b/include/linux/kdb.h
> > @@ -13,6 +13,8 @@
> >   * Copyright (C) 2009 Jason Wessel <jason.wessel@windriver.com>
> >   */
> >
> > +#include <linux/list.h>
> > +
> >  /* Shifted versions of the command enable bits are be used if the command
> >   * has no arguments (see kdb_check_flags). This allows commands, such as
> >   * go, to have different permissions depending upon whether it is called
> > @@ -64,6 +66,17 @@ typedef enum {
> >
> >  typedef int (*kdb_func_t)(int, const char **);
> >
> > +/* The KDB shell command table */
> > +typedef struct _kdbtab {
> > +       char    *cmd_name;              /* Command name */
> > +       kdb_func_t cmd_func;            /* Function to execute command */
> > +       char    *cmd_usage;             /* Usage String for this command */
> > +       char    *cmd_help;              /* Help message for this command */
> > +       short    cmd_minlen;            /* Minimum legal # cmd chars required */
> > +       kdb_cmdflags_t cmd_flags;       /* Command behaviour flags */
> > +       struct list_head list_node;     /* Command list */
> > +} kdbtab_t;
>
> IMO prefixing all of the members of the structure with "cmd_" just
> makes the code that references them more awkward. For instance, when I
> read:
>
> s->cmd.cmd_name
>
> I wonder why it can't just be:
>
> s->cmd.name
>
>
> > +
> >  #ifdef CONFIG_KGDB_KDB
> >  #include <linux/init.h>
> >  #include <linux/sched.h>
> > @@ -193,19 +206,13 @@ static inline const char *kdb_walk_kallsyms(loff_t *pos)
> >  #endif /* ! CONFIG_KALLSYMS */
> >
> >  /* Dynamic kdb shell command registration */
> > -extern int kdb_register(char *, kdb_func_t, char *, char *, short);
> > -extern int kdb_register_flags(char *, kdb_func_t, char *, char *,
> > -                             short, kdb_cmdflags_t);
> > -extern int kdb_unregister(char *);
> > +extern int kdb_register(kdbtab_t *cmd);
> > +extern int kdb_unregister(kdbtab_t *cmd);
>
> I suggest changing kdb_unregister() to return "void". It can no longer
> fail and generally we can't really do anything if unregister calls
> fail anyway.
>
>
> >  #else /* ! CONFIG_KGDB_KDB */
> >  static inline __printf(1, 2) int kdb_printf(const char *fmt, ...) { return 0; }
> >  static inline void kdb_init(int level) {}
> > -static inline int kdb_register(char *cmd, kdb_func_t func, char *usage,
> > -                              char *help, short minlen) { return 0; }
> > -static inline int kdb_register_flags(char *cmd, kdb_func_t func, char *usage,
> > -                                    char *help, short minlen,
> > -                                    kdb_cmdflags_t flags) { return 0; }
> > -static inline int kdb_unregister(char *cmd) { return 0; }
> > +static inline int kdb_register(kdbtab_t *cmd) { return 0; }
> > +static inline int kdb_unregister(kdbtab_t *cmd) { return 0; }
> >  #endif /* CONFIG_KGDB_KDB */
> >  enum {
> >         KDB_NOT_INITIALIZED,
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 1baa96a2ecb8..de685b2a8ce7 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -33,7 +33,6 @@
> >  #include <linux/kallsyms.h>
> >  #include <linux/kgdb.h>
> >  #include <linux/kdb.h>
> > -#include <linux/list.h>
> >  #include <linux/notifier.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/delay.h>
> > @@ -654,16 +653,14 @@ static void kdb_cmderror(int diag)
> >   * Returns:
> >   *     zero for success, a kdb diagnostic if error
> >   */
> > -struct defcmd_set {
> > +struct kdb_macro_t {
> >         int count;
> >         bool usable;
> > -       char *name;
> > -       char *usage;
> > -       char *help;
> > +       kdbtab_t cmd;
> >         char **command;
> >  };
> > -static struct defcmd_set *defcmd_set;
> > -static int defcmd_set_count;
> > +static struct kdb_macro_t *kdb_macro;
> > +static int kdb_macro_count;
>
> It would have made my review job easier if the rename from
> "defcmd_set" to "kdb_macro" was in a separate no-op change...
>
>
> >  static bool defcmd_in_progress;
> >
> >  /* Forward references */
> > @@ -671,20 +668,14 @@ static int kdb_exec_defcmd(int argc, const char **argv);
> >
> >  static int kdb_defcmd2(const char *cmdstr, const char *argv0)
> >  {
> > -       struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
> > +       struct kdb_macro_t *s = kdb_macro + kdb_macro_count - 1;
> >         char **save_command = s->command;
> >         if (strcmp(argv0, "endefcmd") == 0) {
> >                 defcmd_in_progress = false;
> >                 if (!s->count)
> >                         s->usable = false;
> >                 if (s->usable)
> > -                       /* macros are always safe because when executed each
> > -                        * internal command re-enters kdb_parse() and is
> > -                        * safety checked individually.
> > -                        */
>
> You dropped this comment. Should it instead move into kdb_defcmd()
> where you set the KDB_ENABLE_ALWAYS_SAFE flag?
>
>
> > -                       kdb_register_flags(s->name, kdb_exec_defcmd, s->usage,
> > -                                          s->help, 0,
> > -                                          KDB_ENABLE_ALWAYS_SAFE);
> > +                       kdb_register(&s->cmd);
> >                 return 0;
> >         }
> >         if (!s->usable)
> > @@ -704,7 +695,9 @@ static int kdb_defcmd2(const char *cmdstr, const char *argv0)
> >
> >  static int kdb_defcmd(int argc, const char **argv)
> >  {
> > -       struct defcmd_set *save_defcmd_set = defcmd_set, *s;
> > +       struct kdb_macro_t *save_kdb_macro = kdb_macro, *s;
> > +       kdbtab_t *mp;
> > +
> >         if (defcmd_in_progress) {
> >                 kdb_printf("kdb: nested defcmd detected, assuming missing "
> >                            "endefcmd\n");
> > @@ -712,9 +705,9 @@ static int kdb_defcmd(int argc, const char **argv)
> >         }
> >         if (argc == 0) {
> >                 int i;
> > -               for (s = defcmd_set; s < defcmd_set + defcmd_set_count; ++s) {
> > -                       kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->name,
> > -                                  s->usage, s->help);
> > +               for (s = kdb_macro; s < kdb_macro + kdb_macro_count; ++s) {
> > +                       kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->cmd.cmd_name,
> > +                                  s->cmd.cmd_usage, s->cmd.cmd_help);
> >                         for (i = 0; i < s->count; ++i)
> >                                 kdb_printf("%s", s->command[i]);
> >                         kdb_printf("endefcmd\n");
> > @@ -727,45 +720,50 @@ static int kdb_defcmd(int argc, const char **argv)
> >                 kdb_printf("Command only available during kdb_init()\n");
> >                 return KDB_NOTIMP;
> >         }
> > -       defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
> > +       kdb_macro = kmalloc_array(kdb_macro_count + 1, sizeof(*kdb_macro),
> >                                    GFP_KDB);
>
> Looking at the code that follows makes me think we should have been
> using krealloc_array(), but I guess we don't need to bother since the
> next patch changes all of it. ;-)
>
>
> > -       if (!defcmd_set)
> > +       if (!kdb_macro)
> >                 goto fail_defcmd;
> > -       memcpy(defcmd_set, save_defcmd_set,
> > -              defcmd_set_count * sizeof(*defcmd_set));
> > -       s = defcmd_set + defcmd_set_count;
> > +       memcpy(kdb_macro, save_kdb_macro,
> > +              kdb_macro_count * sizeof(*kdb_macro));
> > +       s = kdb_macro + kdb_macro_count;
> >         memset(s, 0, sizeof(*s));
> >         s->usable = true;
> > -       s->name = kdb_strdup(argv[1], GFP_KDB);
> > -       if (!s->name)
> > +
> > +       mp = &s->cmd;
> > +       mp->cmd_func = kdb_exec_defcmd;
> > +       mp->cmd_minlen = 0;
> > +       mp->cmd_flags = KDB_ENABLE_ALWAYS_SAFE;
> > +       mp->cmd_name = kdb_strdup(argv[1], GFP_KDB);
> > +       if (!mp->cmd_name)
> >                 goto fail_name;
> > -       s->usage = kdb_strdup(argv[2], GFP_KDB);
> > -       if (!s->usage)
> > +       mp->cmd_usage = kdb_strdup(argv[2], GFP_KDB);
> > +       if (!mp->cmd_usage)
> >                 goto fail_usage;
> > -       s->help = kdb_strdup(argv[3], GFP_KDB);
> > -       if (!s->help)
> > +       mp->cmd_help = kdb_strdup(argv[3], GFP_KDB);
> > +       if (!mp->cmd_help)
> >                 goto fail_help;
> > -       if (s->usage[0] == '"') {
> > -               strcpy(s->usage, argv[2]+1);
> > -               s->usage[strlen(s->usage)-1] = '\0';
> > +       if (mp->cmd_usage[0] == '"') {
> > +               strcpy(mp->cmd_usage, argv[2]+1);
> > +               mp->cmd_usage[strlen(mp->cmd_usage)-1] = '\0';
> >         }
> > -       if (s->help[0] == '"') {
> > -               strcpy(s->help, argv[3]+1);
> > -               s->help[strlen(s->help)-1] = '\0';
> > +       if (mp->cmd_help[0] == '"') {
> > +               strcpy(mp->cmd_help, argv[3]+1);
> > +               mp->cmd_help[strlen(mp->cmd_help)-1] = '\0';
> >         }
> > -       ++defcmd_set_count;
> > +       ++kdb_macro_count;
> >         defcmd_in_progress = true;
> > -       kfree(save_defcmd_set);
> > +       kfree(save_kdb_macro);
> >         return 0;
> >  fail_help:
> > -       kfree(s->usage);
> > +       kfree(mp->cmd_usage);
> >  fail_usage:
> > -       kfree(s->name);
> > +       kfree(mp->cmd_name);
> >  fail_name:
> > -       kfree(defcmd_set);
> > +       kfree(kdb_macro);
> >  fail_defcmd:
> > -       kdb_printf("Could not allocate new defcmd_set entry for %s\n", argv[1]);
> > -       defcmd_set = save_defcmd_set;
> > +       kdb_printf("Could not allocate new kdb_macro entry for %s\n", argv[1]);
> > +       kdb_macro = save_kdb_macro;
> >         return KDB_NOTIMP;
> >  }
> >
> > @@ -781,14 +779,14 @@ static int kdb_defcmd(int argc, const char **argv)
> >  static int kdb_exec_defcmd(int argc, const char **argv)
> >  {
> >         int i, ret;
> > -       struct defcmd_set *s;
> > +       struct kdb_macro_t *s;
> >         if (argc != 0)
> >                 return KDB_ARGCOUNT;
> > -       for (s = defcmd_set, i = 0; i < defcmd_set_count; ++i, ++s) {
> > -               if (strcmp(s->name, argv[0]) == 0)
> > +       for (s = kdb_macro, i = 0; i < kdb_macro_count; ++i, ++s) {
> > +               if (strcmp(s->cmd.cmd_name, argv[0]) == 0)
> >                         break;
> >         }
> > -       if (i == defcmd_set_count) {
> > +       if (i == kdb_macro_count) {
> >                 kdb_printf("kdb_exec_defcmd: could not find commands for %s\n",
> >                            argv[0]);
> >                 return KDB_NOTIMP;
> > @@ -797,7 +795,7 @@ static int kdb_exec_defcmd(int argc, const char **argv)
> >                 /* Recursive use of kdb_parse, do not use argv after
> >                  * this point */
> >                 argv = NULL;
> > -               kdb_printf("[%s]kdb> %s\n", s->name, s->command[i]);
> > +               kdb_printf("[%s]kdb> %s\n", s->cmd.cmd_name, s->command[i]);
> >                 ret = kdb_parse(s->command[i]);
> >                 if (ret)
> >                         return ret;
> > @@ -2620,55 +2618,6 @@ static int kdb_grep_help(int argc, const char **argv)
> >         return 0;
> >  }
> >
> > -/*
> > - * kdb_register_flags - This function is used to register a kernel
> > - *     debugger command.
> > - * Inputs:
> > - *     cmd     Command name
> > - *     func    Function to execute the command
> > - *     usage   A simple usage string showing arguments
> > - *     help    A simple help string describing command
> > - *     repeat  Does the command auto repeat on enter?
> > - * Returns:
> > - *     zero for success, one if a duplicate command.
> > - */
> > -int kdb_register_flags(char *cmd,
> > -                      kdb_func_t func,
> > -                      char *usage,
> > -                      char *help,
> > -                      short minlen,
> > -                      kdb_cmdflags_t flags)
> > -{
> > -       kdbtab_t *kp;
> > -
> > -       list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> > -               if (strcmp(kp->cmd_name, cmd) == 0) {
> > -                       kdb_printf("Duplicate kdb command registered: "
> > -                               "%s, func %px help %s\n", cmd, func, help);
> > -                       return 1;
> > -               }
> > -       }
> > -
> > -       kp = kmalloc(sizeof(*kp), GFP_KDB);
> > -       if (!kp) {
> > -               kdb_printf("Could not allocate new kdb_command table\n");
> > -               return 1;
> > -       }
> > -
> > -       kp->cmd_name   = cmd;
> > -       kp->cmd_func   = func;
> > -       kp->cmd_usage  = usage;
> > -       kp->cmd_help   = help;
> > -       kp->cmd_minlen = minlen;
> > -       kp->cmd_flags  = flags;
> > -       kp->is_dynamic = true;
> > -
> > -       list_add_tail(&kp->list_node, &kdb_cmds_head);
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(kdb_register_flags);
> > -
> >  /*
> >   * kdb_register_table() - This function is used to register a kdb command
> >   *                        table.
> > @@ -2684,54 +2633,37 @@ void kdb_register_table(kdbtab_t *kp, size_t len)
> >  }
> >
> >  /*
>
> You intended to make this kernel doc style, right? So "/**" here?
>
>
> > - * kdb_register - Compatibility register function for commands that do
> > - *     not need to specify a repeat state.  Equivalent to
> > - *     kdb_register_flags with flags set to 0.
> > - * Inputs:
> > - *     cmd     Command name
> > - *     func    Function to execute the command
> > - *     usage   A simple usage string showing arguments
> > - *     help    A simple help string describing command
> > - * Returns:
> > - *     zero for success, one if a duplicate command.
> > + * kdb_register() - This function is used to register a kernel debugger
> > + *                  command.
> > + * @cmd: pointer to kdb command
>
> You should document that it's the job of the caller to keep the memory
> for the cmd allocated until unregister is called.
>
> I'll also note that your diffs would be slightly easier to understand
> if you moved your new kdb_register() to before kdb_register_table().
> That's because the new kdb_register() is more similar to the old
> kdb_register_flags().
>
>
> >   */
> > -int kdb_register(char *cmd,
> > -            kdb_func_t func,
> > -            char *usage,
> > -            char *help,
> > -            short minlen)
> > -{
> > -       return kdb_register_flags(cmd, func, usage, help, minlen, 0);
> > -}
> > -EXPORT_SYMBOL_GPL(kdb_register);
> > -
> > -/*
> > - * kdb_unregister - This function is used to unregister a kernel
> > - *     debugger command.  It is generally called when a module which
> > - *     implements kdb commands is unloaded.
> > - * Inputs:
> > - *     cmd     Command name
> > - * Returns:
> > - *     zero for success, one command not registered.
> > - */
> > -int kdb_unregister(char *cmd)
> > +int kdb_register(kdbtab_t *cmd)
> >  {
> >         kdbtab_t *kp;
> >
> > -       /*
> > -        *  find the command.
> > -        */
> >         list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> > -               if (strcmp(kp->cmd_name, cmd) == 0) {
> > -                       list_del(&kp->list_node);
> > -                       if (kp->is_dynamic)
> > -                               kfree(kp);
> > -                       return 0;
> > +               if (strcmp(kp->cmd_name, cmd->cmd_name) == 0) {
> > +                       kdb_printf("Duplicate kdb cmd: %s, func %p help %s\n",
> > +                                  cmd->cmd_name, cmd->cmd_func, cmd->cmd_help);
> > +                       return 1;
> >                 }
> >         }
> >
> > -       /* Couldn't find it.  */
> > -       return 1;
> > +       list_add_tail(&cmd->list_node, &kdb_cmds_head);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(kdb_register);
> > +
> > +/*
>
> You intended to make this kernel doc style, right? So "/**" here?
>
>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
