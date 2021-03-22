Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3419344B1D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 17:23:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lONL5-0002tu-DW
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 16:23:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lONHC-0002jb-90
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 16:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eldFodHTbSBJUE2zcFhJoaj3CYiDURbwU2RZsCSY3vk=; b=iJ3Zyde7B0weMHyYN/TMREHBqB
 vzTacpqRCNVfTPCknJDPKdsmCrj2ttebeRIYJCewh9M8p41FOPP2M3K6QAjtAlFoOeFT/KEDnQCFl
 SiTrcZkQhNzrCa4S7Vha+Wtx21DNT2zunSrWAa1ys8X6LwqkyFtQABmmr3vtLp8JYHXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eldFodHTbSBJUE2zcFhJoaj3CYiDURbwU2RZsCSY3vk=; b=WCFwfSgOse8oHGyqFtAQSZDM+Z
 5bDB1lmsA2KO6/rLYMFqXkC1NdtbvEljQ6r4x+CiLMIxVFpiFMDYBa55dWuG7S+K4GZSFmg7NHMyT
 JqLCtL83O25LuEmaJ0Am0gZ283OK35jQLeuQCELiGXH2rW8T6Cxnvr08ARlKsz66ER08=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lONH0-0000px-0j
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 16:19:34 +0000
Received: by mail-ed1-f48.google.com with SMTP id dm8so20097478edb.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eldFodHTbSBJUE2zcFhJoaj3CYiDURbwU2RZsCSY3vk=;
 b=iR453lW6sLP64qnFJYDmv4LE+4sZNsatktXtJrVGX0ebjNnNdfszZqv/O8c5sz6Lql
 3cF2GGsmMczfu/Y8Z9DpcpoDV2f1l+sOluo8NnCVJvA59cxfjdJ/2Z60y+N3n7lyfJ+F
 Wj+3Gd8uM7NuTZ8/QXuz/TN8mHEDeWdFbDs47VrQnK58TNAnLVP7w9GvSHD1DnTB+P/S
 2qvHT7o9/F75zGzpStGm9i4CdN0XzV81skEHiWn1JR8IBB349l7yE6X6ah2gYH8Dra27
 WrlqSv1hmz5Miwu12AnySMAg2Cu5YrRJ3LJQJDmXUxAsG8qB+ucSWyzp2ae3pQRUJyGU
 5Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eldFodHTbSBJUE2zcFhJoaj3CYiDURbwU2RZsCSY3vk=;
 b=INLPcIlEndRbLap2iD2qk/cjcm2L5HoSxGLEO2Ni0HwBt5J/EKSTKtlXE/cIhQ6B54
 Oe308hRRgDbWPtTMhxNTQOqqBTl3DT3QMOpzdtqfrlpASRyvRBQrmeFJUtXIiyOFVY5n
 59tYSIsIsSMbk5JvWx1oQ7Wfj84ayH8+eOYKS2FE/CJWBJyBMBSLC6Z7bkSTlNGn+LRA
 xzW5I/sn32E0t8PUJ5FRjwWhFHufopH1XowBh6QH+pol6yVfS5NaqRJKHNneqm4IYmom
 K3uDBb0B0qMhpjX4IbSSyiso4sDbCWL+uWKezELbvJIIzVgIzw1XPwJ3neV2t8tMhGSI
 KeDA==
X-Gm-Message-State: AOAM530b9AtIdRt/mLu84k48RI0mArWP1MqofsESxRNgLh3IkRnNxe3y
 j2EJSPf27JaRTyhVTZo4vFU5Uw==
X-Google-Smtp-Source: ABdhPJxzhZ75lilJTGnJ2uSE44+ivj3vV6JfjU0UFJ/NAJPT46u2jR9a2541CVFtYpcFf8t22GkKPg==
X-Received: by 2002:aa7:d841:: with SMTP id f1mr367235eds.286.1616429955708;
 Mon, 22 Mar 2021 09:19:15 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y17sm9746213ejf.116.2021.03.22.09.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:19:15 -0700 (PDT)
Date: Mon, 22 Mar 2021 16:19:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Message-ID: <20210322161913.fbvrtnorezojddee@maple.lan>
References: <20210317104658.4053473-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317104658.4053473-1-unixbhaskar@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lONH0-0000px-0j
Subject: Re: [Kgdb-bugreport] [PATCH V2] kernel: debug: Ordinary typo fixes
 in the file gdbstub.c
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Mar 17, 2021 at 04:16:58PM +0530, Bhaskar Chowdhury wrote:
> s/overwitten/overwritten/
> s/procesing/processing/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied, Thanks!


Daniel.


> ---
> Changes from V1:
>  As Daniel pointed out, I was misdoing a check,so corrected
> 
>  kernel/debug/gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index e149a0ac9e9e..8372897402f4 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -321,7 +321,7 @@ int kgdb_hex2long(char **ptr, unsigned long *long_val)
>  /*
>   * Copy the binary array pointed to by buf into mem.  Fix $, #, and
>   * 0x7d escaped with 0x7d. Return -EFAULT on failure or 0 on success.
> - * The input buf is overwitten with the result to write to mem.
> + * The input buf is overwritten with the result to write to mem.
>   */
>  static int kgdb_ebin2mem(char *buf, char *mem, int count)
>  {
> @@ -952,7 +952,7 @@ static int gdb_cmd_exception_pass(struct kgdb_state *ks)
>  }
> 
>  /*
> - * This function performs all gdbserial command procesing
> + * This function performs all gdbserial command processing
>   */
>  int gdb_serial_stub(struct kgdb_state *ks)
>  {
> --
> 2.30.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
