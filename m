Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C37300B0B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 19:25:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l317P-0004QM-Uw
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 18:25:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l317N-0004Q5-W5
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 18:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmG3ReoOA+nFPdXtaVvEXKSYJ1hlcICvB+O+sBZ8Rxs=; b=NfGfzczRGzoSJmj6zbs2Fin5mt
 rVdqasKJ0DuReJvzM60sIeHworBhoSOIddE5+IJGMbbfw+XxFkVFdlpbWKm/GI/SlXohszLKTfzzS
 TNhsURlzHXVyqmvo+S8oVnMlDXfaAcs6mQ+jOs2IY7zahP7OPr704b/0Hago10+Ez2H4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qmG3ReoOA+nFPdXtaVvEXKSYJ1hlcICvB+O+sBZ8Rxs=; b=bn9DO5KWfmnmHzVH6LA04g3NnF
 fWdzp6IwMaxCKizHpdaHq1VQ9BZvKkZizmEzzR40PuH5smK+0B/1NHXJgRGbi1Z/CdPyew7TyoopF
 W1uC4skcbR8fuMuuDSkyiQxbsP5628r7TUhXb8X22fqXU+ttF1wijMOyvmmS53El2hds=;
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l317K-00B8DX-Lk
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 18:25:09 +0000
Received: by mail-ot1-f42.google.com with SMTP id n42so5979456ota.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmG3ReoOA+nFPdXtaVvEXKSYJ1hlcICvB+O+sBZ8Rxs=;
 b=BPbc972+YUig5NQtxOSZg1EHCRcGGhpBv63PGBCsP3/QeXaDnBsC/61eMD37MX0uMN
 ZhmDjYDXz45huhioduettk9AW1GqVp0JBbK15z7BRc2ri7dbK9F+6g4UBens8NOAJm/V
 w48k13PY+LsADehsNNoI1EOXdrCmtQAA4E0HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmG3ReoOA+nFPdXtaVvEXKSYJ1hlcICvB+O+sBZ8Rxs=;
 b=qwLBagOKTpj3fTLzLeyn65Q1M0EFfj4n0ZanjnAka/+tuqDP0ONcIWzEb+w2E01K74
 lo5+1VuqFXvTTE7TTmnVzn5gwnVZapr22MAhlPv/HHaXFI91cIIgOuYRHmJEG7sYrmLP
 4oywHAjV+OG10J4sayOjhat8T2LVv8DlA1Yt2pyvKU+U+bi8QAI2j5P+ibFXHNGtkGmu
 JzDm4NGDk9/Rl+0UmTEo1e8IV0zrUKUkEWS5+7mEXribXNnx3cytIrWNj17xmwa6Moxa
 aU9rZfrWMEPlYFVIAu7S2f28c/jZaT45ICRSJE4wmqCnvKRA/ZPmwicFaictvvzs2dh3
 AZKA==
X-Gm-Message-State: AOAM531Rt4oFAlX7O/Cqz24YN7jzc3R1f/dEdfzSUQumJjaQ1BjoSUTe
 GbER2XG/ppqKHVnUMfR8KGf6tAQZOclKkQ==
X-Google-Smtp-Source: ABdhPJxnCBRYnSmXXUfvfDBKV+Ym9oF0rLGhzCuSn/y9R9ZmMQfcbgS6zAEKwfJWM2ZIgYEfbY/C4Q==
X-Received: by 2002:a9f:2c07:: with SMTP id r7mr1287780uaj.4.1611336357979;
 Fri, 22 Jan 2021 09:25:57 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id w66sm1298395vkb.50.2021.01.22.09.25.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:25:56 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id o125so3420015vsc.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 09:25:56 -0800 (PST)
X-Received: by 2002:a67:ed09:: with SMTP id l9mr789858vsp.4.1611336356103;
 Fri, 22 Jan 2021 09:25:56 -0800 (PST)
MIME-Version: 1.0
References: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1611313556-4004-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Jan 2021 09:25:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
Message-ID: <CAD=FV=V8HwhdhpCoiZx4XbTMWug0CAxhsnPR+5V9rB0W7QXFTQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l317K-00B8DX-Lk
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Make memory allocations more
 robust
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
 LKML <linux-kernel@vger.kernel.org>, "# 4.0+" <stable@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jan 22, 2021 at 3:06 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Currently kdb uses in_interrupt() to determine whether its library
> code has been called from the kgdb trap handler or from a saner calling
> context such as driver init.  This approach is broken because
> in_interrupt() alone isn't able to determine kgdb trap handler entry from
> normal task context. This can happen during normal use of basic features
> such as breakpoints and can also be trivially reproduced using:
> echo g > /proc/sysrq-trigger

I guess an alternative to your patch is to fully eliminate GFP_KDB.
It always strikes me as a sub-optimal design to choose between
GFP_ATOMIC and GFP_KERNEL like this.  Presumably others must agree
because otherwise I'd expect that the overall kernel would have
something like "GFP_AUTOMATIC"?

It doesn't feel like it'd be that hard to do something more explicit.
From a quick glance:

* I think kdb_defcmd() and kdb_defcmd2() are always called in response
to a user typing something on the kdb command line.  Those should
always be GFP_ATOMIC, right?

* The one call that's not in kdb_defcmd() / kdb_defcmd2() is in
kdb_register_flags().  That can be called either during init time or
from kdb_defcmd2().  It doesn't seem like it'd be hard to rename
kdb_register_flags() to _kdb_register_flags() and add a "gfp_t flags"
to the end.  Then the exported kdb_register_flags() would pass
GFP_KERNEL and the call from kdb_defcmd2() would pass GFP_ATOMIC:


> We can improve this by adding check for in_dbg_master() instead which

s/adding check/adding a check/


> explicitly determines if we are running in debugger context.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v3:
> - Refined commit description and Cc: stable@vger.kernel.org.
>
> Changes in v2:
> - Get rid of redundant in_atomic() check.
>
>  kernel/debug/kdb/kdb_private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I would leave it up to Daniel to say whether he agrees that a full
removal of "GFP_KDB" would be a better solution.  However, your patch
clearly improves the state of things, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
