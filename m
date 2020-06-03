Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F601ECC5F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 11:18:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgPXr-0002YZ-Bo
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 09:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jgPXo-0002Y5-V8
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 09:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lC+yaFN5vqc/aVbyNoEXwYFQWDaby68sSTwiOnwtwTs=; b=cJrH8b4ZLyYwYadKbpq9Yzn5gZ
 YBU6uj2tjEqUpLEs5S088cD9UpI6s4IfK/z7lG/+/7M6s4ul8XvncUIZlWzS2cZxkQ/gTgr+Il4Ha
 VRwaqOsGrN++e97rKwln/wWNWOwJvr1xEv+rj9qOsu0AkJZgj5Nzv/BwvW9QpvRPAOPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lC+yaFN5vqc/aVbyNoEXwYFQWDaby68sSTwiOnwtwTs=; b=V+DkjjYwzc8dyEp7vfvOtjR5fk
 +9FvutzvKR3fvX8fzkB1y/bxa2duWCkt3rcPZ9Nko708fmyrml9hm33/K1+XDnmQsL5Xi5ADUZki5
 Al+Pt7BvRDBsSrSgI82pdFal1Pj+/ssKo/uUoVGlc8ft6ELUwFtpa/Lu7SrfSmPNpBNo=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgPXj-003jAh-TF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 09:18:44 +0000
Received: by mail-wr1-f68.google.com with SMTP id l11so1556978wru.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lC+yaFN5vqc/aVbyNoEXwYFQWDaby68sSTwiOnwtwTs=;
 b=ofod8KOHtXbZVUwpsoXnjSbVzBlN/vkZpExe7bFZ1xIu+y4lSTiShRRrKsVXaQpjet
 jRerdIe5syxoF6sVqjNYbtId0YU5Fd33uYYWuXbjaFMw5O8eLoLxSXXdAyIdZ/byK2ut
 OEStls5AAOJUYPSBY4fDoNlgiTwc2tCtOJeDu/NklMeMnEUwF6yThRuLsovJAuaTpoQK
 QIsnyyEjcDY44PvQZezVmWSbF0POjccEZz0AJraZ9tLnN3nsq42RYSvDe0B3eHlmeumb
 FHqMlqbjZEHqWJke3IMxb8gZeyqAn4Ydzt/CjrQ/Y1r36HkjVa3RvVnWmsn0IsKND17k
 /m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lC+yaFN5vqc/aVbyNoEXwYFQWDaby68sSTwiOnwtwTs=;
 b=o9FabICcWjxuOi2UXglrVij8O53zAt/oFJ1nD7v7/BCmY7ZmkoZdBcLDIF3qZxbBVX
 BBNOqsqXm7euVWhKYL6ZMT7JzIpIGquOa8+rRha9SdN3axfWBglFqxAw+HyX4dI/ienw
 2zGwWZejtk1Ev55dlJOOoF1nR1XMVC8YHrdouGMJQ0lv25a0xTpyScoZUtVKFpc+Flfq
 3chbtxxowso31pQvdfqRoOKQu8bhoRoRVmCKbPsOfmeLU8Di9ii9A/bqrXNVgnXJbjeY
 hoQCZ6iyh8v1O9QtQPzITx2PXgaAB1sZ/lL43Hw+onhxH+KXZyTt8pk20LooGn7sMK/F
 mcxg==
X-Gm-Message-State: AOAM5306tuo/TFDTUm6Givi71naszZh6BTzGUp38fGh7vMAgEKNGdcI6
 Rz5dvmnuFcNpDCE6hLHLXxhNgg==
X-Google-Smtp-Source: ABdhPJzrjB3ao0sWWKCA+EfaW/ASvKGJcBR3ptKjutcrPJXvUzAYEGSsczu/mQTJYdlBKssj7rSPKQ==
X-Received: by 2002:adf:f389:: with SMTP id m9mr28272738wro.195.1591175913374; 
 Wed, 03 Jun 2020 02:18:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d191sm1619668wmd.44.2020.06.03.02.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:18:32 -0700 (PDT)
Date: Wed, 3 Jun 2020 10:18:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20200603091830.azwneja736lvqo4n@holly.lan>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
 <1591168935-6382-5-git-send-email-sumit.garg@linaro.org>
 <20200603082503.GD14855@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603082503.GD14855@linux-b0ei>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jgPXj-003jAh-TF
Subject: Re: [Kgdb-bugreport] [PATCH v5 4/4] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: gregkh@linuxfoundation.org, jslaby@suse.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, jason.wessel@windriver.com,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 03, 2020 at 10:25:04AM +0200, Petr Mladek wrote:
> On Wed 2020-06-03 12:52:15, Sumit Garg wrote:
> > In kgdb context, calling console handlers aren't safe due to locks used
> > in those handlers which could in turn lead to a deadlock. Although, using
> > oops_in_progress increases the chance to bypass locks in most console
> > handlers but it might not be sufficient enough in case a console uses
> > more locks (VT/TTY is good example).
> > 
> > Currently when a driver provides both polling I/O and a console then kdb
> > will output using the console. We can increase robustness by using the
> > currently active polling I/O driver (which should be lockless) instead
> > of the corresponding console. For several common cases (e.g. an
> > embedded system with a single serial port that is used both for console
> > output and debugger I/O) this will result in no console handler being
> > used.
> > 
> > In order to achieve this we need to reverse the order of preference to
> > use dbg_io_ops (uses polling I/O mode) over console APIs. So we just
> > store "struct console" that represents debugger I/O in dbg_io_ops and
> > while emitting kdb messages, skip console that matches dbg_io_ops
> > console in order to avoid duplicate messages. After this change,
> > "is_console" param becomes redundant and hence removed.
> > 
> > diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> > index 4139698..6e182aa 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -558,6 +557,7 @@ static int __init kgdboc_earlycon_init(char *opt)
> >  	}
> >  
> >  	earlycon = con;
> > +	kgdboc_earlycon_io_ops.cons = con;
> >  	pr_info("Going to register kgdb with earlycon '%s'\n", con->name);
> >  	if (kgdb_register_io_module(&kgdboc_earlycon_io_ops) != 0) {
> >  		earlycon = NULL;
> 
> Should we clear kgdboc_earlycon_io_ops.cons here when
> kgdb_register_io_module() failed?
> 
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index c62d764..529116b 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -276,8 +276,7 @@ struct kgdb_arch {
> >   * the I/O driver.
> >   * @post_exception: Pointer to a function that will do any cleanup work
> >   * for the I/O driver.
> > - * @is_console: 1 if the end device is a console 0 if the I/O device is
> > - * not a console
> > + * @cons: valid if the I/O device is a console; else NULL.
> >   */
> >  struct kgdb_io {
> >  	const char		*name;
> > @@ -288,7 +287,7 @@ struct kgdb_io {
> >  	void			(*deinit) (void);
> >  	void			(*pre_exception) (void);
> >  	void			(*post_exception) (void);
> > -	int			is_console;
> > +	struct console		*cons;
> 
> Nit: I would call it "con". The trailing 's' makes me feel that that the
>      variable points to an array or list of consoles.

How strongly do you feel about it?


I'd probably agree with you except that the uart subsystem, which is by
far the most prolific supplier of consoles for kgdb to use, calls
pointers to single consoles "cons" so I'd prefer to be aligned on
terminology.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
