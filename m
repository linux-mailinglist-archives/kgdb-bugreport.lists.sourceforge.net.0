Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE52B8654
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 18 Nov 2020 22:13:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kfUli-0005wG-0j
	for lists+kgdb-bugreport@lfdr.de; Wed, 18 Nov 2020 21:13:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1kfUlg-0005vy-0t
 for kgdb-bugreport@lists.sourceforge.net; Wed, 18 Nov 2020 21:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gmn9WoSAuN+ZJjZPOe3qZzXt6xhGyzpsU2qXRea0W1M=; b=TFcIKGM1hrBO/m4tO8rMuEOYdx
 H96e4ChhS3r4EcAMpxF1dPU0Rp3cz+Id8mGFzmBBIR0KBFNfkOfIm2Zf6DA2gtS8EbstGOhp6gJFI
 njgPF0e3rfjPJwfKaYbubXgHVnhVJj23OAlMEHXV4PZT6JyvRE2tVZX1awsEtCEJE2qM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gmn9WoSAuN+ZJjZPOe3qZzXt6xhGyzpsU2qXRea0W1M=; b=HUNaGlZSl/DPIh2RoX0fPrJP4l
 UbJBhkNEUqgVlH0O/C1RDvplq+GjlLQCE4DJSAS3w1dsFoxBWIxj7q+Grg1dTixL2+n9X5AySHFtt
 FMno/Z3cCfhszln0bxQs4q3Z13VcZ6lLe92ofhDOePLjbNQoUIshf3/0RzqFfoIa3fEA=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfUlU-00EeAC-R5
 for kgdb-bugreport@lists.sourceforge.net; Wed, 18 Nov 2020 21:13:31 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id DF9EE1F5B;
 Wed, 18 Nov 2020 20:48:06 +0000 (UTC)
Date: Wed, 18 Nov 2020 13:48:05 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20201118134805.7304a9bf@lwn.net>
In-Reply-To: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
References: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kfUlU-00EeAC-R5
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: kgdb: Fix a typo
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-doc@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 16 Nov 2020 17:42:47 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> "to into" -> "into"
> 
> Reported-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  Documentation/dev-tools/kgdb.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index 77b688e..4345624 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -63,10 +63,9 @@ will want to turn on ``CONFIG_DEBUG_INFO`` which is called
>  It is advised, but not required, that you turn on the
>  ``CONFIG_FRAME_POINTER`` kernel option which is called :menuselection:`Compile
>  the kernel with frame pointers` in the config menu. This option inserts code
> -to into the compiled executable which saves the frame information in
> -registers or on the stack at different points which allows a debugger
> -such as gdb to more accurately construct stack back traces while
> -debugging the kernel.
> +into the compiled executable which saves the frame information in registers
> +or on the stack at different points which allows a debugger such as gdb to
> +more accurately construct stack back traces while debugging the kernel.

Applied.

In the future, though, please avoid refilling paragraphs when you make a
change like this; it makes it much harder to see what has actually changed.

Thanks,

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
