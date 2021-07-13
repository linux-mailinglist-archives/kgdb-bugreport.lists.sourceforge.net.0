Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B13C6FB0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Jul 2021 13:24:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m3GWd-0003ZB-RH
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Jul 2021 11:24:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1m3GWc-0003Z4-AX
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 11:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NHt/FAPTgdkn/SCe9iIi6CS+dHhhoK3TCnPN2KGs+7Q=; b=g1G7kFE0RHo0Q2WRfHL2kmpQVe
 MY6TbAQ0QuwOtyDJZoxg0kXNeK6fvfONCVYzK/VfME0I0DrBD/utGz6N9lT3lerN847yuc+r2a9aJ
 B8ec3Q0Lv0uUdcV8sgyCGIuJra97Y/k3sICxHxn8xZaEBsSTArfcl7RNlRqI0Iysr0ds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NHt/FAPTgdkn/SCe9iIi6CS+dHhhoK3TCnPN2KGs+7Q=; b=Bs46VXE/3fB74RHtuzNQkTKqW9
 2kRY+evYF9uiYglqWh+0wL1+uKbFlMI0uM4R5GXarH+0z/LYdbq8SSmW9+PEROY2eiehLSNoW++1s
 cNXgzYOK322LWroTrHLNG7V6X+N2ao2UZ0jaHmZXAb1eZCIMbNXCcizzaVRDfrOGJMVY=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3GWT-006sI6-5q
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Jul 2021 11:24:30 +0000
Received: by mail-lf1-f53.google.com with SMTP id 8so37951844lfp.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 13 Jul 2021 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NHt/FAPTgdkn/SCe9iIi6CS+dHhhoK3TCnPN2KGs+7Q=;
 b=lmDlWFric5SOGHr8CKmkpMY3KyZMfDnA9ZalS30heq3oOLSas+s5EtHgQez5BBCC9F
 DzFzGOv6MeewWI83AWbc3YktnJCFJ/Row9Z7OZMSVUK8FwO0iQi79MrTXQO1DsXOp3ST
 VYkF1RfC3AbsHrC5WAipTewBjrLT8sXS3lkMEvYDyojecG+3Kn5SirWRgEnV4ZU0OS9U
 GPghg3Ofx04dFWveWSqu1VAhFsjXzQBthuZH6dXPKo+QvX2P1FKpwaTqV5yChDS9nDNB
 jCZddxIdhhKZ7P5AuGwXbdGJoilOCj6byThBU81tPabnsc19ijMjYrqnFKl+9sfHyapn
 czLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NHt/FAPTgdkn/SCe9iIi6CS+dHhhoK3TCnPN2KGs+7Q=;
 b=DQKLJd7Fw5Ogna18QeiSaFotyQLcABudtC+3tHIUbIhr09X7S3A5SCROysWrHB6bSW
 Yroc+n6RLe+vowAuckgGzdnIDFWs2XMDLqq2O7ugjRtDEhTe/odrEujxZx2X+krPhY5L
 C1oiXcLg99PA5Uj5UbDMUmzB0xWQPR3O6bufLZWcMeWe45Uw5DcM85f+KHhp+zvYgY9X
 5I/wLUxCWuyq6KfyCZNTtacwXQuETRI53+7PuKjuTZ79Hs3c0QN2ZczkiOxExcgbTGsP
 XndqAx4zLY8C1eB7GlSmTcYyXQBVRc/Oys5DCAbjiYh50rLmNAmVoTfMcNrJnW0XogDt
 z/ag==
X-Gm-Message-State: AOAM532qb4+dm4GeuzGWgw1pcCTwkvBtpMHTrmhCA5Km3sih98SZn1+M
 qgLMVT1oOla/nOyJuaiRz9x3D0GL/RCvYg5M8KBI6Q==
X-Google-Smtp-Source: ABdhPJz6PSHuCCjPY2PtMT1jbw39ipBG5mD8rGosrIASuHXyjj6I47h50G3MX5yNF0RJcO/qWIa+sjdRXRUwHZWa+2M=
X-Received: by 2002:a19:e002:: with SMTP id x2mr3175379lfg.84.1626175454465;
 Tue, 13 Jul 2021 04:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210708122447.3880803-1-sumit.garg@linaro.org>
 <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
In-Reply-To: <CAD=FV=UhL32e7spQjr38Lwng0D7mUK+R7iGnmBah=tXzzXsO5g@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 13 Jul 2021 16:54:03 +0530
Message-ID: <CAFA6WYN4gMv9Hkuq=3v_UKg+Y1OvFfbOqgZxt7yGSd2RnVBdJw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m3GWT-006sI6-5q
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Get rid of custom debug heap
 allocator
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

Thanks for your review.

On Tue, 13 Jul 2021 at 04:20, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 8, 2021 at 5:25 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > @@ -233,10 +232,6 @@ extern struct task_struct *kdb_curr_task(int);
> >
> > @@ -52,48 +52,48 @@ int kdbgetsymval(const char *symname, kdb_symtab_t *symtab)
> >  }
> >  EXPORT_SYMBOL(kdbgetsymval);
> >
> > -static char *kdb_name_table[100];      /* arbitrary size */
> > -
> >  /*
> > - * kdbnearsym -        Return the name of the symbol with the nearest address
>
> nit: This is now kernel-doc, right? So start with "/**" ?
>

Ack.

> > - *     less than 'addr'.
> > + * kdbnearsym() - Return the name of the symbol with the nearest address
> > + *                less than @addr.
> > + * @addr: Address to check for near symbol
> > + * @symtab: Structure to receive results
> >   *
> > - * Parameters:
> > - *     addr    Address to check for symbol near
> > - *     symtab  Structure to receive results
> > - * Returns:
> > - *     0       No sections contain this address, symtab zero filled
> > - *     1       Address mapped to module/symbol/section, data in symtab
> > - * Remarks:
> > - *     2.6 kallsyms has a "feature" where it unpacks the name into a
> > - *     string.  If that string is reused before the caller expects it
> > - *     then the caller sees its string change without warning.  To
> > - *     avoid cluttering up the main kdb code with lots of kdb_strdup,
> > - *     tests and kfree calls, kdbnearsym maintains an LRU list of the
> > - *     last few unique strings.  The list is sized large enough to
> > - *     hold active strings, no kdb caller of kdbnearsym makes more
> > - *     than ~20 later calls before using a saved value.
> > + * WARNING: This function may return a pointer to a single statically
> > + * allocated buffer (namebuf). kdb's unusual calling context (single
> > + * threaded, all other CPUs halted) provides us sufficient locking for
> > + * this to be safe. The only constraint imposed by the static buffer is
> > + * that the caller must consume any previous reply prior to another call
> > + * to lookup a new symbol.
> > + *
> > + * Note that, strictly speaking, some architectures may re-enter the kdb
> > + * trap if the system turns out to be very badly damaged and this breaks
> > + * the single-threaded assumption above. In these circumstances successful
> > + * continuation and exit from the inner trap is unlikely to work and any
> > + * user attempting this receives a prominent warning before being allowed
> > + * to progress. In these circumstances we remain memory safe because
> > + * namebuf[KSYM_NAME_LEN-1] will never change from '\0' although we do
> > + * tolerate the possibility of garbled symbol display from the outer kdb
> > + * trap.
> > + *
> > + * Return:
> > + * * 0 - No sections contain this address, symtab zero filled
> > + * * 1 - Address mapped to module/symbol/section, data in symtab
> >   */
> >  int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> >  {
> >         int ret = 0;
> >         unsigned long symbolsize = 0;
> >         unsigned long offset = 0;
> > -#define knt1_size 128          /* must be >= kallsyms table size */
> > -       char *knt1 = NULL;
> > +       static char namebuf[KSYM_NAME_LEN];
>
> I guess this also ends up fixing a bug too, right? My greps show that
> "KSYM_NAME_LEN" is 512

I can see "KSYM_NAME_LEN" defined as 128 here [1]. Are you looking at
any other header file?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/kallsyms.h#n18

> and the first thing kallsyms_lookup() does it
> zero out byte 511. Previously we were only allocating 128 bytes so I
> guess we were writing past the end.
>
> Assuming I understood correctly, maybe mention the bugfix in the commit text?
>
>
> > @@ -102,63 +102,14 @@ int kdbnearsym(unsigned long addr, kdb_symtab_t *symtab)
> >         symtab->sym_end = symtab->sym_start + symbolsize;
> >         ret = symtab->sym_name != NULL && *(symtab->sym_name) != '\0';
> >
> > -       if (ret) {
> > -               int i;
> > -               /* Another 2.6 kallsyms "feature".  Sometimes the sym_name is
> > -                * set but the buffer passed into kallsyms_lookup is not used,
> > -                * so it contains garbage.  The caller has to work out which
> > -                * buffer needs to be saved.
> > -                *
> > -                * What was Rusty smoking when he wrote that code?
> > -                */
> > -               if (symtab->sym_name != knt1) {
> > -                       strncpy(knt1, symtab->sym_name, knt1_size);
> > -                       knt1[knt1_size-1] = '\0';
> > -               }
> > -               for (i = 0; i < ARRAY_SIZE(kdb_name_table); ++i) {
> > -                       if (kdb_name_table[i] &&
> > -                           strcmp(kdb_name_table[i], knt1) == 0)
> > -                               break;
> > -               }
> > -               if (i >= ARRAY_SIZE(kdb_name_table)) {
> > -                       debug_kfree(kdb_name_table[0]);
> > -                       memmove(kdb_name_table, kdb_name_table+1,
> > -                              sizeof(kdb_name_table[0]) *
> > -                              (ARRAY_SIZE(kdb_name_table)-1));
> > -               } else {
> > -                       debug_kfree(knt1);
> > -                       knt1 = kdb_name_table[i];
> > -                       memmove(kdb_name_table+i, kdb_name_table+i+1,
> > -                              sizeof(kdb_name_table[0]) *
> > -                              (ARRAY_SIZE(kdb_name_table)-i-1));
> > -               }
> > -               i = ARRAY_SIZE(kdb_name_table) - 1;
> > -               kdb_name_table[i] = knt1;
> > -               symtab->sym_name = kdb_name_table[i];
> > -               knt1 = NULL;
>
> I definitely had a hard time following exactly what all the cases were
> handling and if they were all right, but I agree that we can kill the
> old code (yay!)
>
>
> > @@ -249,6 +200,7 @@ void kdb_symbol_print(unsigned long addr, const kdb_symtab_t *symtab_p,
> >                       unsigned int punc)
> >  {
> >         kdb_symtab_t symtab, *symtab_p2;
> > +
> >         if (symtab_p) {
> >                 symtab_p2 = (kdb_symtab_t *)symtab_p;
> >         } else {
>
> nit: unrelated whitespace change?
>

Will revert.

>
> All comments above are nits and not terribly important, so:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
-Sumit


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
