Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0B30F62D
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 16:24:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7gUt-0007Yb-0B
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 15:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l7gUr-0007YC-C4
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=; b=DPfFSG4VogKMjvWfhlUg6hFUO0
 iEcX6W9rejHVA5u+y3ufbcZJv7zjY/Dv55yyNds2o6a7hoQlcOcDPYx02OrI0eP0KUudxENBD+a1m
 lBuRHLi7VLcPKFVzr7qgBDvv8sRlazw1qwhbfxqxDdM6RTA+NIhD881R7Ao+/ljcXh7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=; b=BQCtx9PzRMkzR0uAzlopWkpTBM
 3NlyM6JfnO+qsm8q0YCeb7sC5IXQGsZa6J3kl/6sR/pJWRmzXyMABmE3E8g5xcCe1kLoWl9IIpAep
 iTrLEKymnPJCGg0duu/+osel2Z9c7FC1khqbWKIua39AJFs/LnkuzVFsxYTq8rhIpgho=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7gUj-00006j-PJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 15:24:41 +0000
Received: by mail-wm1-f51.google.com with SMTP id j21so622013wmj.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
 b=CS+l9f4lcjQCD8lvkOFJ7F2ir8HDh268KpXOnkoYr9gE61e9FZYgQ0Cua27KtyefIr
 Cax9XopiM/Py5GmEzOBl6PzaL+BDr17+QouJZIUhJz4ZPljaiWRa32HyK8Psrhnq/jRO
 KXNpzCWUE6/sV0KVcfpAY64TWGdKEJ4dQVBvCIFiBYbj0XFJXxtxwHdFr0a/Pe7VyExD
 nKTqvvrmXI/BAS0Tbjq/v+iaSGc8BjsEfqzi6QjryJDeqsE7JTbMYxqnjpaJoVTRF4YB
 feD4fLtSYCsG1C4wiBZKdvmC529xYxeUZky9pfTV5tAQrEWBH1fLjHetH1uChLcH9hIY
 kxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2d6JxtJOaxpmDK1rvlDktYLwQC3lg/WsDdaZFNHm0QY=;
 b=htQEuOPFZvor6S3jG5JG0ctViNPLckPDqQ58efMpf7LUSjZB9IhxBGlG8/qqoFSwVs
 zJHQVJkFutn18461g+1qiQf824+HfYMkU0+tE5+NcklvF/Ubufe/PF3a1STbWJN3FWXF
 8a8MG4TFFCYpUby4Z2Jvdy+sZjDZGG2ke+Jte0iny43UwU7waPv6uvI+DBA5lHP/oawb
 ZcH0YIdcxxK7zPABTiLOotiF0AdppNkTIOS3qNJPTKbJ66Dpm2JDb8X05P/sZ736NMiv
 0ZG38zEM2oKb7uzuCXJXSxRC2J3qOITlV5F3KGhVOwnYdQKXUzHH+Sv8AA6R1K/Hm+Wg
 aUBA==
X-Gm-Message-State: AOAM532zHyNsFrLOIfHPsOWdianQwgoheeWrPL/2yTEo9KfL6tKD5f2M
 Trh42rLACjsamGswA4dQLL+bRA==
X-Google-Smtp-Source: ABdhPJzK+8hQQQd0W7CJq91rYRYdkogA/OEcRNJrNNUYDyrb4ShwlZGlpUWjPbji1ZjJoPZYHtjbFQ==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr30310wmd.9.1612452267459;
 Thu, 04 Feb 2021 07:24:27 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id k6sm8892749wro.27.2021.02.04.07.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:24:26 -0800 (PST)
Date: Thu, 4 Feb 2021 15:24:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <20210204152424.wrq3bgmq77fssjwj@maple.lan>
References: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l7gUj-00006j-PJ
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: rectify kernel-doc for
 kgdb_unregister_io_module()
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-doc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 25, 2021 at 03:48:47PM +0100, Lukas Bulwahn wrote:
> The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
> reported a typo in the kernel-doc of kgdb_unregister_io_module().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied. Thanks.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
