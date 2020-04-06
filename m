Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085019EF28
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  6 Apr 2020 03:40:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jLGk9-0006dX-5F
	for lists+kgdb-bugreport@lfdr.de; Mon, 06 Apr 2020 01:40:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jLGk7-0006dQ-WC
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 01:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRwtpAe/SaXgFTw9DNk+qemSVp8LrFTj/+VL0HITjJU=; b=O3ysKhfS4WzethNHCXq+icHUDC
 yEnMYJ3mOWF9Z9a7qu9DY9GdgV9k0EZiOZq2E3JXgKT9+xMmdlX7k4sRNB3CXE9lRc6e0wRyJgocu
 RkXjUPhH5VVm3xNHpGBtig13eRpiVemIqQ7/wQUuHMySRfG+D3Zn9Wtns8fORKzcY90I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nRwtpAe/SaXgFTw9DNk+qemSVp8LrFTj/+VL0HITjJU=; b=aRn8E9YA6O/7fKxtqKv5cYn7s5
 OJO5iouoXYQzmVuhB06dVu4sVCcVJzsmci4rBOHY1pg9U5E4SkORubF1hRm0Fs6O71AXeRRfcZeCG
 8okYeKtHccjIgs/oXU7yfwucpruXbGALmHk2ASBUN+gnGMRFyDuFskq5oaw/o2fuuuMc=;
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jLGk4-003xkJ-JU
 for kgdb-bugreport@lists.sourceforge.net; Mon, 06 Apr 2020 01:40:03 +0000
Received: by mail-qt1-f196.google.com with SMTP id z12so11695131qtq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 05 Apr 2020 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRwtpAe/SaXgFTw9DNk+qemSVp8LrFTj/+VL0HITjJU=;
 b=NXVSssbNfhsIUwDNjjrgfayy6crT8Hc8jrDbUYXUOtvcrCDb47PaeHUGglnfRVx+ek
 4r3Ws5Va/xomeabxnOlOIUtnrMih+jsouFGgjuYFZb8CRr56kTxAPzy+42lezxUndNgL
 wyzAEGNjfYINuxItq1PYX4bZfEVj6DtdYpKRVyA+nSSfEavn5k/TJaAoec/wxMS7kbUU
 zJMcDDwXkPvnfntwHBVxxmyNe/HfHxvEeZW+xOKIEKMFW8zA+90txHhpgOFgYAWwnslm
 LZqFvoIE7FwVSh7+PQCFfkNCxky63FjXvzvNCceNRB+MgjpzP7IFW+gxigsONzJDxOsv
 8K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRwtpAe/SaXgFTw9DNk+qemSVp8LrFTj/+VL0HITjJU=;
 b=RGWH5E3URy98XlS3NEbcJNQlAtV6dqNhmqSQGHG2Ocki76TLaeImXQDtc7QqX9Ovq1
 sEsPZj+x0Pt/qt6DNuSbOpknHKupPpr97CxsnVdCJs5KZ2mmRQykPaFbtNa1+7yXdY6a
 nLgOT5qXBTzmZ4/4p2EW7RSuzn4sHxNSGPaedt26EYpSPoM5SlTQYQ4H6P0jXIa+lAUS
 zMASpUEs2nkIpeF+9T6xsmTZBpJabq4i63B7BET5GGfbs1c7M6pH+QUaQ4IVUXBhC9Lu
 iZS63WYOf3tSwhbCYbVAVDW6ntjRvrks3BRsNdSBYW85NfTdf/nNSUZXam+QybNdWLxn
 AZfg==
X-Gm-Message-State: AGi0Pubo9m4xod1bhbT2G12YG5Q1GJGx2ZskjTuBCE2UTVkMQuaG18/G
 fSVEBIhfaGZE+6451kr5w9Lf3JdXpvCjiNYPFEejl3o+Hfs=
X-Google-Smtp-Source: APiQypI4c/oB+fQaWbjY5asExUxOB9ixUg/6qX+UXAP+RvnOhSiojque2JJIc4wulN2xoGz12Q5k2+FvEHuyvhd4J8w=
X-Received: by 2002:a05:620a:1189:: with SMTP id
 b9mr19013740qkk.236.1586133744291; 
 Sun, 05 Apr 2020 17:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <1585668191-16287-4-git-send-email-vincent.chen@sifive.com>
 <20200403100353.szkaovdjajjwtqvq@holly.lan>
In-Reply-To: <20200403100353.szkaovdjajjwtqvq@holly.lan>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 6 Apr 2020 08:42:13 +0800
Message-ID: <CABvJ_xgS0dvXDqTGvmV+AhBt0tRxbF+ZvyuLzoCprErorxqKuQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jLGk4-003xkJ-JU
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/5] kgdb: enable arch to support
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 3, 2020 at 6:03 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Mar 31, 2020 at 11:23:09PM +0800, Vincent Chen wrote:
> > The XML packet could be supported by required architecture if the
> > architecture defines CONFIG_ACRH_SUPPORTS_GDB_XML and implement its own
> > arch_handle_qxfer_pkt(). Except for the arch_handle_qxfer_pkt(), the
> > architecture also needs to record the feature supported by gdb stub into
> > the arch_gdb_stub_feature, and these features will be reported to host gdb
> > when gdb stub receives the qSupported packet.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  include/linux/kgdb.h   |  9 +++++++++
> >  kernel/debug/gdbstub.c | 13 +++++++++++++
> >  lib/Kconfig.kgdb       |  5 +++++
> >  3 files changed, 27 insertions(+)
> >
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index b072aeb1fd78..ee9109d2f056 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -177,6 +177,15 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
> >                          struct pt_regs *regs);
> >
> >  /**
> > + *   arch_handle_qxfer_pkt - Handle architecture specific GDB XML packets.
> > + *   @remcom_in_buffer: The buffer of the packet we have read.
> > + *   @remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> > + */
> > +
> > +extern void
> > +arch_handle_qxfer_pkt(char *remcom_in_buffer, char *remcom_out_buffer);
>
> This should be prefixed kgdb_ like the other arch functions.
>

Ok, I will add the prefixed kgdb_ to the arch_handle_qxfer_pkt().

>
> > +
> > +/**
> >   *   kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
> >   *   @ignored: This parameter is only here to match the prototype.
> >   *
> > diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> > index 4b280fc7dd67..d6b1b630a7e7 100644
> > --- a/kernel/debug/gdbstub.c
> > +++ b/kernel/debug/gdbstub.c
> > @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
> >               }
> >               break;
> >  #endif
> > +#ifdef CONFIG_ACRH_SUPPORTS_GDB_XML
>
> Typo (and perhaps insufficient testing ;-) ).
>
> Additional the naming of the CONFIG option looks wrong because it
> describes why you added it, not what it actually does. Something
> like CONFIG_HAVE_ARCH_KGDB_QXFER_PKT is more descriptive.
>

OK, I will modify it.

>
> > +     case 'S':
> > +             if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> > +                     strcpy(remcom_out_buffer, arch_gdb_stub_feature);
>
> Has this been declared anywhere? I cannot find it.
>
> This might also benefit from a kgdb_ prefix.
>

I think the supported functions depend on the implementation of the
architectures.
Therefore, I define arch_gdb_stub_feature[] in the
arch/riscv/include/asm/gdb_xml.h.
OK, I will add the kgdb_ prefix to arch_gdb_stub_feature[].
Thanks

>
> > +             break;
> > +     case 'X':
> > +             if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> > +                     arch_handle_qxfer_pkt(remcom_in_buffer,
> > +                                           remcom_out_buffer);
> > +             break;
> > +#endif
> > +     default:
> > +             break;
> >       }
> >  }
> >
> > diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> > index 933680b59e2d..5b586a3bba90 100644
> > --- a/lib/Kconfig.kgdb
> > +++ b/lib/Kconfig.kgdb
> > @@ -3,6 +3,11 @@
> >  config HAVE_ARCH_KGDB
> >       bool
> >
> > +# set if architecture implemented the arch_handle_qxfer_pkt function
> > +# to enable gdb stub to address XML packet sent from GDB.
> > +config ARCH_SUPPORTS_GDB_XML
> > +     bool
> > +
> >  menuconfig KGDB
> >       bool "KGDB: kernel debugger"
> >       depends on HAVE_ARCH_KGDB
> > --
> > 2.7.4
> >


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
