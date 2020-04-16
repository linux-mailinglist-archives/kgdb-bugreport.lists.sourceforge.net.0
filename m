Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CC1AB4C3
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Apr 2020 02:29:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOsPa-0002ji-Bk
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Apr 2020 00:29:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jOsPY-0002jP-LP
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 00:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeDWfkYBflB6EXLJxPtKLM2FrMMRcS25RI68mbe9KPw=; b=a65TN1LnBac/q7Okzc5ElRRQ3y
 7UsCHZ4QsV4Q6MBUKi5hF29hl+vWTGzEXcc5DvH/l8f6o39AtMIFUkhm4NFiPjLiV019vhPYaQyFV
 9HIP5OoZWbu7TcI7fnfeJSCKzefUVNOSVazj2EonFLwD9AdIXN7iHXijHshuwewO24YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DeDWfkYBflB6EXLJxPtKLM2FrMMRcS25RI68mbe9KPw=; b=frmpyKpyWh+yOW7cy/uInWROiW
 aWY0h7mkPU4SsNg7KgTxKbec7NQq5EY2AwZIokZ7x2/wijjRwxgrRmFdH6UPvEHhiJm2nd34CZTWA
 2mH0Lpbd+yEoVxtJZeumVpvuu8Kq/ELHuH2moOKzYiFoM9tpZCNMM4t+rwknF9hRQ4Qo=;
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOsPV-003Lls-Iq
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Apr 2020 00:29:44 +0000
Received: by mail-qk1-f193.google.com with SMTP id l78so3935305qke.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 17:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DeDWfkYBflB6EXLJxPtKLM2FrMMRcS25RI68mbe9KPw=;
 b=l35urU22FMZQ0HM6XOkqpxzd68QfnEdIKEi7UpDeYUW2DY247H0F1JnLYLxmg3FSUM
 duyXrza6Gp6snsiJqe3B/moN0POYnYyCxVqj96W8+TXfVFGNeZIIF0B0oP1l1kA+qAUc
 mTgpK00W2UuGk19QZ/21qSVA5Sn/DyJG/bnShprLXKoGeeVQg1rcCDDiU4B7N4nVnowY
 dlN5RNcLl8YlM6Fr6b40oJgTkEPMmhp/xN+ttP/8dqO7OU2rRxm2Y30u5iY9upEg3N1L
 wXigRcC4lsHqGt2ni4Y/JSAkS2POtZ+dL523gPX3vhZmcTjvxA5KwrrVm4Y7KhwL+kyI
 lQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DeDWfkYBflB6EXLJxPtKLM2FrMMRcS25RI68mbe9KPw=;
 b=uhtEuAinXnfI9ZBSmZT6yG5drSTxWjjKDKax5WGHu5Smo+CFSfQQfBxivhYCO48GOg
 3au/ZUQiOX27Re6sV1TxWYtBcnqnJwg/4bNS2lh8gXNvLyYF8DztqmigYRE3ysptKfIR
 gxhWSTlCXEbc2rhi7xRXowo/p66fOeYKJEKqoS3ERbdSA0GEYu72m+sFwfsUTAqPdUTi
 1VSnRX5gf2V3ffkMAXzXj9tE/qlr7q7X9zWxF3hBYZqjC8E03qQ6X5Ak4yUNn6CWf8cW
 PvLxCno9SAvQupcagrbvRFu0gLAtAoPFgtUNpzhN+3rmrW8nkRdP/ar7x3kOpH64qUUc
 Zjfw==
X-Gm-Message-State: AGi0PuZNJbwoeTF2cX4aTElKxKT2fpJTpx/jGH8SvXKtbjM2WKHf13Qx
 evfctiFxlSIcablZ89C2eL0AV7hFhAKRwYmCjdK2heh4ACk=
X-Google-Smtp-Source: APiQypKY8tr4yYKOvf94GnH3KYP//9YRmVwQ/2pLwanpPLlgBZGm+Wyu1LqPbfuD3MDvkoJvcA0XJHRgqH6GnjGHMzM=
X-Received: by 2002:a05:620a:1189:: with SMTP id
 b9mr28061823qkk.236.1586995407394; 
 Wed, 15 Apr 2020 17:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
 <1586655721-22567-4-git-send-email-vincent.chen@sifive.com>
 <CAFA6WYMsW7KL3D_VrgVheRheNeh8g=G7W=oxOzuytq7rT6-YVw@mail.gmail.com>
In-Reply-To: <CAFA6WYMsW7KL3D_VrgVheRheNeh8g=G7W=oxOzuytq7rT6-YVw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 16 Apr 2020 08:03:16 +0800
Message-ID: <CABvJ_xgotHLZeywyStOjmSNd_bOVgbVHA=TbgAVfN=TPiwy2jA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOsPV-003Lls-Iq
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/5] kgdb: enable arch to support
 XML packet support.
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Apr 15, 2020 at 7:01 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Sun, 12 Apr 2020 at 07:12, Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > The XML packet could be supported by required architecture if the
> > architecture defines CONFIG_ACRH_SUPPORTS_GDB_XML
>
> nitpick, I guess you missed rename here? CONFIG_HAVE_ARCH_KGDB_QXFER_PKT?
>
> -Sumit
>
Ya, I forgot to rename CONFIG_ACRH_SUPPORTS_GDB_XML to
CONFIG_HAVE_ARCH_KGDB_QXFER_PKT here.
Thanks for your reminder. I will modify it in the next version patch.

> > and implement its own
> > arch_handle_qxfer_pkt(). Except for the arch_handle_qxfer_pkt(), the
> > architecture also needs to record the feature supported by gdb stub into
> > the arch_gdb_stub_feature, and these features will be reported to host gdb
> > when gdb stub receives the qSupported packet.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  include/linux/kgdb.h   | 11 +++++++++++
> >  kernel/debug/gdbstub.c | 13 +++++++++++++
> >  lib/Kconfig.kgdb       |  5 +++++
> >  3 files changed, 29 insertions(+)
> >
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index b072aeb1fd78..414bef20a8f3 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -177,6 +177,17 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
> >                            struct pt_regs *regs);
> >
> >  /**
> > + *     kgdb_arch_handle_qxfer_pkt - Handle architecture specific GDB XML
> > + *                                  packets.
> > + *     @remcom_in_buffer: The buffer of the packet we have read.
> > + *     @remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> > + */
> > +
> > +extern void
> > +kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> > +                          char *remcom_out_buffer);
> > +
> > +/**
> >   *     kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
> >   *     @ignored: This parameter is only here to match the prototype.
> >   *
> > diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> > index 4b280fc7dd67..a0617c883029 100644
> > --- a/kernel/debug/gdbstub.c
> > +++ b/kernel/debug/gdbstub.c
> > @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
> >                 }
> >                 break;
> >  #endif
> > +#ifdef CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
> > +       case 'S':
> > +               if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> > +                       strcpy(remcom_out_buffer, kgdb_arch_gdb_stub_feature);
> > +               break;
> > +       case 'X':
> > +               if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> > +                       kgdb_arch_handle_qxfer_pkt(remcom_in_buffer,
> > +                                                  remcom_out_buffer);
> > +               break;
> > +#endif
> > +       default:
> > +               break;
> >         }
> >  }
> >
> > diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> > index 933680b59e2d..d7f70335efaf 100644
> > --- a/lib/Kconfig.kgdb
> > +++ b/lib/Kconfig.kgdb
> > @@ -3,6 +3,11 @@
> >  config HAVE_ARCH_KGDB
> >         bool
> >
> > +# set if architecture has the its kgdb_arch_handle_qxfer_pkt
> > +# function to enable gdb stub to address XML packet sent from GDB.
> > +config HAVE_ARCH_KGDB_QXFER_PKT
> > +       bool
> > +
> >  menuconfig KGDB
> >         bool "KGDB: kernel debugger"
> >         depends on HAVE_ARCH_KGDB
> > --
> > 2.7.4
> >
> >
> >
> > _______________________________________________
> > Kgdb-bugreport mailing list
> > Kgdb-bugreport@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
