Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E5204EA2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Jun 2020 11:59:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jnfiN-0006Vq-Je
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Jun 2020 09:59:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jnfiN-0006Vj-06
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 09:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+qNNJvPj82XIpOTVemM+3ukaRdqJiO16sjw+SINvto=; b=eY6L5duFwTmTwG8Lcy2amJLRzD
 pXaJXSR9bzPanzhhih9pPnFmEyJ28ENMwbRqj8pFqh/NPYcHu4rqeMPesUprHpMYSW3FJtZRbjKl5
 Xb7M/zNwCn92OBQ4mzhARn3ewXSfFZz9YHjliY7m8/SVnelBU1+1J7jUAoPJefL8kXWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+qNNJvPj82XIpOTVemM+3ukaRdqJiO16sjw+SINvto=; b=DV56EpaS+B1MELxUZy9M9Ue07C
 qJ1j7N7k27v0WysewUXOlks1CL4Lp7CvcBTQWQnVssZsF1Q3yHenzOkf9Q+e6Iyqp8jvJfJ7dRHmP
 Yh53ZEo14Uqx0gOHwNrAP+dICxQ2JXmis5gfg4b7kWVmUc8RxNrZxed7Fq1Nyu/BpZv4=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnfiH-00Fr4J-Pj
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Jun 2020 09:59:38 +0000
Received: by mail-lf1-f68.google.com with SMTP id y13so11323274lfe.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Jun 2020 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+qNNJvPj82XIpOTVemM+3ukaRdqJiO16sjw+SINvto=;
 b=Y7xQpZIELfj/IZLk6F58JA8yjaXRzK+OnoXwh0e5UY0T8XwF0JRi2sp3Vb55Apjdzl
 BSi6UOkqflqZjIYef8cv7UxPHjAA7/9KsKdrR33U13EOqr6h7bg/dR9Jdk+NWpJ8ymvX
 UC91iFxPSo9US6Co4+ZY1nXR8EW3/62ZjhAtls1kbdPJyw6mkaQEom/7iVp7+YWPwabA
 +5bSyhJu5g7bdXz/lfL0GoXdTwOvdUjPK3YJ1ao7j0OWPdryjFjv4/6hhg/rbmEMXVpa
 t/vrA87fmv4g3N0UtF4wcqAXTkgVFEhyCwu6KMP+BLan277W8KfEFtrcCa/f7aV/o/6h
 ql1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+qNNJvPj82XIpOTVemM+3ukaRdqJiO16sjw+SINvto=;
 b=pBGdSY728GbfEhagrDSDRr//WlHp2Bpr4j2xn+kggC9+qPgP9gMdPgjYHqEtmwABUe
 /8z7v0RaU8IyjUUhCkybSs6bgVWIhOJlQjXXLLFvgm79Cd91X+dogFLQepDMND8ZmfJQ
 yWSg9gZ5/IWZWsxhAV/vt6KG3m6+IzMTiSbkzTI80p6pHGXkyCIRuuinXZyWlkFG+xwA
 acG2vpxI/PtahV7IUooX+6eeway/pbBtscBbj6qtCZEL0I+0JAvaPRKwVDMCLjxb1M6F
 ag2TzCL/83AKBxI+uTr4wGeLVA/D0IcsXRYFu92aKWsooDMLu/MVBbQn3hVsce5pADoK
 7h3w==
X-Gm-Message-State: AOAM5336STT0hI4YYAGimUkcl1WsiBuGbx9zI+olLPS1Ac8IoObN7zW9
 EUJu4yY3wBSgjBMPJ2yED2hIp/541pperJW5l/A+BA==
X-Google-Smtp-Source: ABdhPJxkpAaMxPSdM3YL9bHG+P55yNE/K8vEWIahviaLzu2MN/Htj2Uu74ty5Acituc9zXDbDVkVHS+V8RASHfrlfXQ=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr4365995lfp.21.1592906366549; 
 Tue, 23 Jun 2020 02:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-5-git-send-email-sumit.garg@linaro.org>
 <20200622163621.s2322lmlv674bsds@holly.lan>
In-Reply-To: <20200622163621.s2322lmlv674bsds@holly.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 15:29:15 +0530
Message-ID: <CAFA6WYNc7hdagBknFGjSF3rXnKGXL4FY+PutkA8iensv9dJHEg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jnfiH-00Fr4J-Pj
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] serial: kgdb_nmi: Add support for
 interrupt based fallback
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 22 Jun 2020 at 22:06, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Jun 22, 2020 at 07:56:21PM +0530, Sumit Garg wrote:
> > From: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Add a generic NMI fallback to support kgdb NMI console feature which can
> > be overridden by arch specific implementation.
>
> arch_kgdb_ops.enable_nmi should probably be killed off. Given we now
> have request_nmi() I'm dubious there are any good reasons to use this
> API.
>

Sounds reasonable. Along with this, kgdb_nmi_poll_knock() seems to be
unused and can be removed as well.

-Sumit

>
> Daniel.
>
>
> > This common fallback mechanism utilizes kgdb IO based interrupt in order
> > to support entry into kgdb if a user types in kgdb_nmi_magic sequence. So
> > during NMI console init, NMI handler is installed corresponding to kgdb
> > IO based NMI which is invoked when a character is pending and that can be
> > cleared by calling @read_char until it returns NO_POLL_CHAR.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tty/serial/kgdb_nmi.c | 47 ++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 40 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/tty/serial/kgdb_nmi.c b/drivers/tty/serial/kgdb_nmi.c
> > index b32c6b1..2580f39 100644
> > --- a/drivers/tty/serial/kgdb_nmi.c
> > +++ b/drivers/tty/serial/kgdb_nmi.c
> > @@ -42,9 +42,46 @@ MODULE_PARM_DESC(magic, "magic sequence to enter NMI debugger (default $3#33)");
> >  static atomic_t kgdb_nmi_num_readers = ATOMIC_INIT(0);
> >  static struct console *orig_dbg_cons;
> >
> > +static int kgdb_nmi_poll_one_knock(void);
> > +
> > +static irqreturn_t kgdb_handle_nmi(int irq, void *dev_id)
> > +{
> > +     int ret;
> > +
> > +     if (kgdb_nmi_knock < 0) {
> > +             kgdb_breakpoint();
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     ret = kgdb_nmi_poll_one_knock();
> > +     if (ret == NO_POLL_CHAR)
> > +             return IRQ_NONE;
> > +
> > +     while (ret != 1) {
> > +             ret = kgdb_nmi_poll_one_knock();
> > +             if (ret == NO_POLL_CHAR)
> > +                     return IRQ_HANDLED;
> > +     }
> > +
> > +     kgdb_breakpoint();
> > +     return IRQ_HANDLED;
> > +}
> > +
> >  static int kgdb_nmi_console_setup(struct console *co, char *options)
> >  {
> > -     arch_kgdb_ops.enable_nmi(1);
> > +     int res;
> > +
> > +     if (arch_kgdb_ops.enable_nmi) {
> > +             arch_kgdb_ops.enable_nmi(1);
> > +     } else if (dbg_io_ops->request_nmi) {
> > +             res = dbg_io_ops->request_nmi(kgdb_handle_nmi, co);
> > +             if (res) {
> > +                     pr_err("ttyNMI0: Cannot request nmi/irq\n");
> > +                     return res;
> > +             }
> > +     } else {
> > +             return -ENODEV;
> > +     }
> >
> >       /* The NMI console uses the dbg_io_ops to issue console messages. To
> >        * avoid duplicate messages during kdb sessions we must inform kdb's
> > @@ -328,9 +365,6 @@ int kgdb_register_nmi_console(void)
> >  {
> >       int ret;
> >
> > -     if (!arch_kgdb_ops.enable_nmi)
> > -             return 0;
> > -
> >       kgdb_nmi_tty_driver = alloc_tty_driver(1);
> >       if (!kgdb_nmi_tty_driver) {
> >               pr_err("%s: cannot allocate tty\n", __func__);
> > @@ -380,9 +414,8 @@ int kgdb_unregister_nmi_console(void)
> >  {
> >       int ret;
> >
> > -     if (!arch_kgdb_ops.enable_nmi)
> > -             return 0;
> > -     arch_kgdb_ops.enable_nmi(0);
> > +     if (arch_kgdb_ops.enable_nmi)
> > +             arch_kgdb_ops.enable_nmi(0);
> >
> >       ret = unregister_console(&kgdb_nmi_console);
> >       if (ret)
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
