Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE751A9C2C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Apr 2020 13:26:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jOgBH-00083u-Am
	for lists+kgdb-bugreport@lfdr.de; Wed, 15 Apr 2020 11:26:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jOgBE-00083e-4o
 for kgdb-bugreport@lists.sourceforge.net; Wed, 15 Apr 2020 11:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfIxXQosRFYKLlIDNyN5+DliCdAEN+OUu1+ZqmS9ak8=; b=BWh+y3D5J2hqJjYxMbAfg1P38Q
 FBowwdkqIArX+h9+viznxoyiGUxoefHVCW6u36TkDYHaxoJAE6BdJUGttyJ6TiEVttN6eetZ+l60g
 IbVIz2/rAF/SZFml6zn8bCabkUHCtP+hm6TzAylLbfhRDN27MpCU0BGCAFUVqUX2PEbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QfIxXQosRFYKLlIDNyN5+DliCdAEN+OUu1+ZqmS9ak8=; b=d/uZwg4+Yw6BWG8GB6L8ITQHZh
 2bOKieRahCsLSQ/tqaMQd4iYFFHras2xCO23w0pQDKh2KwYhdqlyZDsZN+jdYZGH6wgGobzOYnn1D
 riwuKFHGELGCqhdlOMqnt4eAeZ8S9TXpEPcJIrZDkRguLk6zgw8sUJY1mTaskUHrlrGA=;
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOgB6-00GQvk-1f
 for kgdb-bugreport@lists.sourceforge.net; Wed, 15 Apr 2020 11:26:08 +0000
Received: by mail-ed1-f68.google.com with SMTP id v1so4256775edq.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Apr 2020 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QfIxXQosRFYKLlIDNyN5+DliCdAEN+OUu1+ZqmS9ak8=;
 b=cc6xTMwvOKdt1bHu764PvZuR4gEYZvCh+pWEPbs3CQ+PgQfDsUp2vrSMz1KiEzwqE8
 1NF/MV1xj7HVPHlzO3PQ1tfBMhzHLMsnwf37rxQxK6HqNLiArhXI8r6rpB5dDq7Ab//N
 LS4spUULkSzvesbq/55ClH3g6z/yKhS3RlxJdUn4T2/OMDNvUJSos80FasyHRJUUcHRZ
 THlsFWJW6wv6qyp6DCHnFRdQHibCWhk0PHQGQDUmaWX13m/SrougAI6OGJENPAxJ6v9h
 G8PPqJ+N8QYML5SRyD6fYVDbaKu87AiT6Z+Uyth9y42jS8ZdMB1l3Nj4dtghMDJGJWVq
 X5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QfIxXQosRFYKLlIDNyN5+DliCdAEN+OUu1+ZqmS9ak8=;
 b=OzDOPlgfLCi9Svv1z55XLGsJXCcykhZvc4AI4DZkHtVeeNHS+kG601UrbHjU4QhzoQ
 VNapyTD5LkgR6REg8LbneQkzgSqHRE26yg5XfJ259rb0ZHsq7WyiyH4DNfpAubrVcAKz
 evvB51FyUenSL5pPYa+CvfcFTiDDNkue0u+mjsIiPdD3E9g6qHX02rwtmykoZjTE3Qpu
 apZ2JhoQl75BOGGVSTDH/JeZrUZGovFoR7AThFIa77ApirkPp7nkpelLFOerV2N3iGRI
 uJWAcwuDpDdu2FTZ9b9AGGcPlWcVsRa6IfLQloEzQ7mJebhtfyj1/Rak6WJ6/FVH9Ya6
 rMKw==
X-Gm-Message-State: AGi0Pub4IXnpCgiMDUet/C6rE3Orv3fWPMTgDwERO9vIK+0z9CaYafv/
 PKONLQhMM7OeMwnSzZm12rfWgidXTS9DsDPE0qD6HTxTdDw=
X-Google-Smtp-Source: APiQypKftwF2yMXf7ZxkQn5Rqul30KXoWYbkplagB9+tbzyl9fDrvb1kMwNvLje0dLJ18CEJ2M487qrBaBh8Pf4qfyM=
X-Received: by 2002:a2e:b792:: with SMTP id n18mr3016511ljo.281.1586948479277; 
 Wed, 15 Apr 2020 04:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
 <1586655721-22567-4-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1586655721-22567-4-git-send-email-vincent.chen@sifive.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 15 Apr 2020 16:31:07 +0530
Message-ID: <CAFA6WYMsW7KL3D_VrgVheRheNeh8g=G7W=oxOzuytq7rT6-YVw@mail.gmail.com>
To: Vincent Chen <vincent.chen@sifive.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.68 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOgB6-00GQvk-1f
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
 Daniel Thompson <daniel.thompson@linaro.org>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sun, 12 Apr 2020 at 07:12, Vincent Chen <vincent.chen@sifive.com> wrote:
>
> The XML packet could be supported by required architecture if the
> architecture defines CONFIG_ACRH_SUPPORTS_GDB_XML

nitpick, I guess you missed rename here? CONFIG_HAVE_ARCH_KGDB_QXFER_PKT?

-Sumit

> and implement its own
> arch_handle_qxfer_pkt(). Except for the arch_handle_qxfer_pkt(), the
> architecture also needs to record the feature supported by gdb stub into
> the arch_gdb_stub_feature, and these features will be reported to host gdb
> when gdb stub receives the qSupported packet.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  include/linux/kgdb.h   | 11 +++++++++++
>  kernel/debug/gdbstub.c | 13 +++++++++++++
>  lib/Kconfig.kgdb       |  5 +++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..414bef20a8f3 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -177,6 +177,17 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
>                            struct pt_regs *regs);
>
>  /**
> + *     kgdb_arch_handle_qxfer_pkt - Handle architecture specific GDB XML
> + *                                  packets.
> + *     @remcom_in_buffer: The buffer of the packet we have read.
> + *     @remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> + */
> +
> +extern void
> +kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> +                          char *remcom_out_buffer);
> +
> +/**
>   *     kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
>   *     @ignored: This parameter is only here to match the prototype.
>   *
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 4b280fc7dd67..a0617c883029 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>                 }
>                 break;
>  #endif
> +#ifdef CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
> +       case 'S':
> +               if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> +                       strcpy(remcom_out_buffer, kgdb_arch_gdb_stub_feature);
> +               break;
> +       case 'X':
> +               if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> +                       kgdb_arch_handle_qxfer_pkt(remcom_in_buffer,
> +                                                  remcom_out_buffer);
> +               break;
> +#endif
> +       default:
> +               break;
>         }
>  }
>
> diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> index 933680b59e2d..d7f70335efaf 100644
> --- a/lib/Kconfig.kgdb
> +++ b/lib/Kconfig.kgdb
> @@ -3,6 +3,11 @@
>  config HAVE_ARCH_KGDB
>         bool
>
> +# set if architecture has the its kgdb_arch_handle_qxfer_pkt
> +# function to enable gdb stub to address XML packet sent from GDB.
> +config HAVE_ARCH_KGDB_QXFER_PKT
> +       bool
> +
>  menuconfig KGDB
>         bool "KGDB: kernel debugger"
>         depends on HAVE_ARCH_KGDB
> --
> 2.7.4
>
>
>
> _______________________________________________
> Kgdb-bugreport mailing list
> Kgdb-bugreport@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
