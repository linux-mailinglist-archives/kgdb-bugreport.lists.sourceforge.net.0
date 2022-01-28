Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 923974A0399
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 28 Jan 2022 23:24:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nDZft-0007LX-Rq
	for lists+kgdb-bugreport@lfdr.de; Fri, 28 Jan 2022 22:24:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nDZft-0007LR-0O
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 22:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kcukqFB2Mce3QdbJubqacFhf/ApIpRPr+r5PZzJZmjU=; b=H1L8p5+iXmzDvHh360d5sv59B2
 /VueAXnAnNuhnfWjXOVJa9D0lsIuisRQJcazfxFPw5bH6ca3/+oBKiZJlgt1O2F+8JTeSURY17wil
 R6a0T26m8hasX2rjeGlT2q9WK8YiVmCF+zMlaxhFxXscYHv3ZObmEe/gGItt0ORJ40lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kcukqFB2Mce3QdbJubqacFhf/ApIpRPr+r5PZzJZmjU=; b=U16tgQZmUxKoxOa6huFnnshcO0
 lbcb7JmRUNdhoyWsHP/V08GqBfLQtMKM7eT2hLo+gATY1IwCCt28rqHJwY0UvyZgnFc714bp3h7Yf
 vHR9YlnFmPPLOsmfMd8eVdfKV9JANl1BUFPsrWxxerTUibku/XOKEymBIieMj835+1Bs=;
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nDZfq-0005jf-Nq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 22:24:55 +0000
Received: by mail-io1-f49.google.com with SMTP id d188so9527303iof.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Jan 2022 14:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcukqFB2Mce3QdbJubqacFhf/ApIpRPr+r5PZzJZmjU=;
 b=kEyOokOZpOpSkRVUDqQ+jhnPxg2+Zy0uxaD/bF4qTVOq4WYVv5DIJ5rV5VH55Xbtf+
 PrNgg6RDp1pzfNIupQ8uo2sts2p6k1tXDCm1JNOB1rGvo4AiABmjtBjS7au4u+IEPK4K
 7/22pmdD5LryWtyAiniDC6JFW2v3Q4Af1/gtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcukqFB2Mce3QdbJubqacFhf/ApIpRPr+r5PZzJZmjU=;
 b=A/KhYAPDygFKF7E4LUJ5NBm87eF5yDsYXt+IMcSo7Pq5VG+xVChsw/1NAj1HkaertR
 6c2p/xf385Zphnuay+ZPzheWkT8UkqNHPMRpP+sYoof8fLutSyo5IqiJUybB/0ID+yaJ
 uomVR0hC8gZvSkcxaH7wyDFxIuYQ5MCwhR36gxpmDesRnfCUM2Ei2iRA24nfVNjTqY+G
 j+8cD/FbgpKqsif36Ngnze5hdghiaTLC5NvBescSPAqJt4qm3WNraNv6OhMThIvrRTj5
 DLEhScg4jj0sw0FkCHlWA5SN/guqZ5/JouduCQid3jmV8/tuTXALoH4DIBQgqRf3UR1H
 XHNw==
X-Gm-Message-State: AOAM531a1kkFfjWMJyva+iPCQOi4W6s7FWoVkNgl/u2TF75Qrt7ngA/T
 QR2VQvw9Fnl9Xy6ezm5lITFz1cu3lqV4zA==
X-Google-Smtp-Source: ABdhPJyVw8RnVSB9w5Q6VOxINuD1muuBADCcotF0mToDPkEO5s+rgmVaBghOVYsHTtEG0wqNglpbwA==
X-Received: by 2002:a02:93c2:: with SMTP id z60mr6022219jah.211.1643408688969; 
 Fri, 28 Jan 2022 14:24:48 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id c9sm14217145ile.38.2022.01.28.14.24.48
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 14:24:48 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id p7so2569405ilp.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Jan 2022 14:24:48 -0800 (PST)
X-Received: by 2002:a05:6e02:1d9a:: with SMTP id
 h26mr7159636ila.142.1643408688177; 
 Fri, 28 Jan 2022 14:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20220128144055.207267-1-daniel.thompson@linaro.org>
In-Reply-To: <20220128144055.207267-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 28 Jan 2022 14:24:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7h=D+SqLU8Z12YzEjA+kDPjVZ6TxmaH8uQrg1DWT9sg@mail.gmail.com>
Message-ID: <CAD=FV=U7h=D+SqLU8Z12YzEjA+kDPjVZ6TxmaH8uQrg1DWT9sg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Jan 28,
 2022 at 6:41 AM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > Currently kdb_putarea_size() uses copy_from_kernel_nofault() to
 write *to* > arbitrary kernel memory. This is ob [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.49 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDZfq-0005jf-Nq
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix the putarea helper function
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
Cc: kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jan 28, 2022 at 6:41 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kdb_putarea_size() uses copy_from_kernel_nofault() to write *to*
> arbitrary kernel memory. This is obviously wrong and means the memory
> modify ('mm') command is a serious risk to debugger stability: if we poke
> to a bad address we'll double-fault and lose our debug session.
>
> Fix this the (very) obvious way.
>
> Note that there are two Fixes: tags because the API was renamed and this
> patch will only trivially backport as far as the rename (and this is
> probably enough). Nevertheless Christoph's rename did not introduce this
> problem so I wanted to record that!
>
> Fixes: fe557319aa06 ("maccess: rename probe_kernel_{read,write} to copy_{from,to}_kernel_nofault")
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_support.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index df2bface866ef..85cb51c4a17e6 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -291,7 +291,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
>   */
>  int kdb_putarea_size(unsigned long addr, void *res, size_t size)
>  {
> -       int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
> +       int ret = copy_to_kernel_nofault((char *)addr, (char *)res, size);

Looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If you wanted to further clean things up a bit, you could probably get
rid of at some of the unnecessary "char *" casts and also add a
"const", AKA:

int kdb_putarea_size(unsigned long addr, const void *res, size_t size)
{
  int ret = copy_to_kernel_nofault((void *)addr, res, size);


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
