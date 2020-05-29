Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE471E7589
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 07:46:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jeXqf-0003AB-Uk
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 05:46:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jeXqd-0003A3-Vm
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 05:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1uVbFFVStB5c4phiwJ2viwNKkm/fPEp8ZAWXEnpfQC8=; b=Ex4RBMtf39wSHUmTE2tSAkVYaF
 joc9IHffn3uxcz5h++WBryRmObl9SbDLGT2cexh4ajWznszUyFw41tSk6lvEQONDKc7qtU/qbc9sR
 dcAr0Fa/z9wbFRT4cZT8RXtuGRftnohregoiyRE+EdQ7V3/HbDQFfW+aEQHV5d1uo9hQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1uVbFFVStB5c4phiwJ2viwNKkm/fPEp8ZAWXEnpfQC8=; b=U9XN9rTHy+8XT2GBWa6rpXSvbR
 eEGW0ptNfq7+bv9h5EYjb9EgN/5/hIhkA3l0g6L3vr2mQ/IkEgS5djrre6560hJDXJTXfKNfqGk+X
 UUCvSb76WUeorIvK8kcaNXyRasshwt34Q0E7LYVS+YZmFTDeX+rkeiDp2IcZ7poLgJEo=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeXqY-002LYX-W4
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 05:46:27 +0000
Received: by mail-lj1-f193.google.com with SMTP id z13so1059889ljn.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 May 2020 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uVbFFVStB5c4phiwJ2viwNKkm/fPEp8ZAWXEnpfQC8=;
 b=cjh1PibL62d5fJAUTjBlkQsSL7zCsGTOMqk736jIfcWC1sG9LZqJEabmt3REI7veqF
 tN9Wz7UF34ddA06WkbiuwPboV0K7lqGseYo+JQc34MgOOzcboAnsvYmTKYmtO0vZSR2s
 FvRbAmGKYG54if9bPUjzF6/4VYV4vRYsvInbEtUpqTMdhjJdvJFfEqtm9YkYs/fXUNpR
 1Dwst0XNB81qxZGK0p8WFWs52i2Jk22tiFu083B4vsLufEO6c6b+/6RpafXCOPhROt9E
 /h2a4pUhYwx3tMw72JV5RwIrdZpBQ1w8DBxyl6QgQcMJV/q7cowRocFd9lLiiLUV3fOm
 iTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uVbFFVStB5c4phiwJ2viwNKkm/fPEp8ZAWXEnpfQC8=;
 b=IWl752jWzetjoJj3khKqNi3VtlpXYWK2vi1WjclEyrHlGrCqjVTgBSKLBv+5UcsUTo
 MT7ng7FftACo610mcCeOfkeTsQCucAEJOL4ak+Icmw8RyTs0+xKcdtTc4oYZN+6RD89P
 HxfXpFfmlJGpU+m5EfmpmRD1LxxcjHZASWLyxKHj32wLCFg/1WcjDyzt9+1CjNzUp53I
 5rTuV24o7hUuzqWdOSCzAA+J2ZxTWJTO4lDzfejH2pP0CcCVcODJpKnMgi0f6bG/iN+F
 6G8aUxl3GUsG3o6nwyW97mz7N3AeNiqYA/HDmOw14Sq8fZD84IBH8VOP8C0TWWZeZ9hx
 xM6g==
X-Gm-Message-State: AOAM532UQXd6/QuCulwJacVJeVcqxFr4MICNF3zp8zkUE9xX3D+8S4Pp
 2AgL++PGDhl2PukNmMvXTihJAwThcVAKaXUCZJ2NPg==
X-Google-Smtp-Source: ABdhPJyb6oa8fJFntT6QCoy+P+T9Ig6SvCBBijr5OuBOZRTN3r8/IYx5KtW8CSYvWvJgnaVPKZ2n4vYMTylWvrmpJok=
X-Received: by 2002:a2e:2204:: with SMTP id i4mr3411851lji.110.1590731176287; 
 Thu, 28 May 2020 22:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
 <1590560759-21453-5-git-send-email-sumit.garg@linaro.org>
 <20200527133115.x5hqzttsg73saiky@holly.lan>
 <CAFA6WYNeBDRdRqb8dB5HA923ujD3zq7JEQQnV4WJr_fthCc=GQ@mail.gmail.com>
 <20200528112620.a6zhgnkl2izuggsa@holly.lan>
 <20200528145721.GE11286@linux-b0ei>
In-Reply-To: <20200528145721.GE11286@linux-b0ei>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 29 May 2020 11:16:04 +0530
Message-ID: <CAFA6WYO6D-9dT46Zpmm9diW7QQPTWbT64K7XKXQasdwJ4xuZxw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeXqY-002LYX-W4
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Switch kdb_msg_write() to
 use safer polling I/O
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
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, 28 May 2020 at 20:27, Petr Mladek <pmladek@suse.com> wrote:
>
> On Thu 2020-05-28 12:26:20, Daniel Thompson wrote:
> > On Thu, May 28, 2020 at 11:48:48AM +0530, Sumit Garg wrote:
> > > On Wed, 27 May 2020 at 19:01, Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > >
> > > > On Wed, May 27, 2020 at 11:55:59AM +0530, Sumit Garg wrote:
> > > > > In kgdb NMI context, calling console handlers isn't safe due to locks
> > > > > used in those handlers which could lead to a deadlock. Although, using
> > > > > oops_in_progress increases the chance to bypass locks in most console
> > > > > handlers but it might not be sufficient enough in case a console uses
> > > > > more locks (VT/TTY is good example).
> > > > >
> > > > > Currently when a driver provides both polling I/O and a console then kdb
> > > > > will output using the console. We can increase robustness by using the
> > > > > currently active polling I/O driver (which should be lockless) instead
> > > > > of the corresponding console. For several common cases (e.g. an
> > > > > embedded system with a single serial port that is used both for console
> > > > > output and debugger I/O) this will result in no console handler being
> > > > > used.
> > > >
> > > > > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > > > > index b072aeb..05d165d 100644
> > > > > --- a/include/linux/kgdb.h
> > > > > +++ b/include/linux/kgdb.h
> > > > > @@ -275,6 +275,7 @@ struct kgdb_arch {
> > > > >   * for the I/O driver.
> > > > >   * @is_console: 1 if the end device is a console 0 if the I/O device is
> > > > >   * not a console
> > > > > + * @tty_drv: Pointer to polling tty driver.
> > > > >   */
> > > > >  struct kgdb_io {
> > > > >       const char              *name;
> > > > > @@ -285,6 +286,7 @@ struct kgdb_io {
> > > > >       void                    (*pre_exception) (void);
> > > > >       void                    (*post_exception) (void);
> > > > >       int                     is_console;
> > > > > +     struct tty_driver       *tty_drv;
> > > >
> > > > Should this be a struct tty_driver or a struct console?
> > > >
> > > > In other words if the lifetime the console structure is the same as the
> > > > tty_driver then isn't it better to capture the console instead
> > > > (easier to compare and works with non-tty devices such as the
> > > > USB debug mode).
> > > >
> > >
> > > IIUC, you mean to say we can easily replace "is_console" with "struct
> > > console". This sounds feasible and should be a straightforward
> > > comparison in order to prefer "dbg_io_ops" over console handlers. So I
> > > will switch to use "struct console" instead.
> >
> > My comment contains an if ("if the lifetime of the console structure is
> > the same") so you need to check that it is true before sharing a patch to
> > make the change.
>
> Honestly, I am not completely familiar with the console an tty drivers
> code.
>
> Anyway, struct console is typically statically defined by the console
> driver code. It is not must to have but I am not aware of any
> driver where it would be dynamically defined.
>

Yes this is mine understanding as well.

> On the other hand, struct tty_driver is dynamically allocated
> when the driver gets initialized.
>
> So I would say that it is pretty safe to store struct console.

Okay.

> Well, you need to call con->device() to see if the tty_driver
> is actually initialized.

Agree and con->device() is already invoked here [1]. So we only need
to store struct console if con->device() invocation returns success.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/kgdboc.c#n174

-Sumit

>
> Best Regards,
> Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
