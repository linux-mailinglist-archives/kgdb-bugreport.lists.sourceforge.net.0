Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFE344E16
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 19:04:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOOuz-00085R-4f
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 18:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@kernel.org>) id 1lOOue-00082F-9a
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 18:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCoD0hADJ3YK+tIVlWVerxJmcARg3G+cexRwU1qHPlg=; b=GoWwakZQPOTNV/ppF1Ysj3dkJZ
 A5NVVtKbwIhgX82tsxWUT2h/LHmIJNqnRPr8TCNNtKgxcwVy7IlFvqrgb5kd3x7k3n6u4umJDPdsE
 NOdAdYmpzBzEuWFHoPLbffuNUflrlPU+5rYOYLlu/qt4lYXJFLI5NgFGRNuQ1K2xtqpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OCoD0hADJ3YK+tIVlWVerxJmcARg3G+cexRwU1qHPlg=; b=AN6ptueiDNR3GJLp7eP/ng0wWo
 P2rrU4DpPZOGQQyk8v3K90TEiSB3R36c9LF7Qy1lMBXx+2usRLn0/dEfurRszYBkU25XNVDJfxg4B
 8CHwVWn99+cS8QW8t/HL91cPn+CEkPYjU8BMilvcEali1gdgBaeg3sFHmABcJH9JapzI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOOuU-0005OM-TZ
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 18:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F40F06197F
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616436243;
 bh=5Dn/hzqvZfSibFJhzGcqjPoya56ScHhqsZpa8x6VWX0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mGJK1XbPpLAS5gt6K2+ft0a24oaImXngmCFuMPdWEZ8Ny1YO1AlTm70mhV+/+SnQD
 fDvwjYS3kX3vJG/1U/gXQH5SvK9Nulu6KdmDPUv+62Qinal/Kpmtyoocyznf73+VQV
 GxnqUq70OCBfSO8CoXe5x/baUVPmhR58EbzXZ7xwTQWfJ753HgbaVmswPuFsknUoVq
 gC9nB2yuqiVaoTNxVDQrNPN3aK8oPxuGZFdoqzvsBzAxzo4qap46DZUyHUN3jLekuX
 b44wTwGv1tNHcf+t0DyUFVU0QfqyE+8Emu6AEuoz3mrA0WdE7bMzrpLboJtgDSc2Sb
 z1Fq6oiWSFgSw==
Received: by mail-ot1-f44.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so16565915otb.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 11:04:02 -0700 (PDT)
X-Gm-Message-State: AOAM5329d83POy4nSXe7PZWpM49132QsE6TCWXtQXAQXU689wmV/fTe0
 tkhGnoKTZwIn6/O99K3CexNUagYQx6rdXRsO32U=
X-Google-Smtp-Source: ABdhPJw2un5ttiBaTn5Ti+2EjMAxggLyyWzU0D2isr+3+g++2JMn1SriCCHJ98YWT4UBLzCftEdxJBVrwoZCF0dR4us=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr921029otq.251.1616436242366; 
 Mon, 22 Mar 2021 11:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210322164308.827846-1-arnd@kernel.org>
 <20210322170330.wil52d2geopfnfka@maple.lan>
In-Reply-To: <20210322170330.wil52d2geopfnfka@maple.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 19:03:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a30_E5ouw2eGF0wAYd0CiKcekKkEe9xBay2K+OXkyx-gw@mail.gmail.com>
Message-ID: <CAK8P3a30_E5ouw2eGF0wAYd0CiKcekKkEe9xBay2K+OXkyx-gw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOOuU-0005OM-TZ
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@elte.hu>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 22, 2021 at 6:03 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Which tree do you want to merge this one though? I've got nothing else
> pending for this file so I am very relaxed about the route...

I don't plan to merge any of the build fixes through my own tree.
If you don't have anything else, maybe Greg can pick it up
in the char-misc tree.

         Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
