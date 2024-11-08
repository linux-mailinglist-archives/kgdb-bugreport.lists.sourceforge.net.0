Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E09C1BD9
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 12:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9MpH-0006SG-RB
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 11:06:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t9MpG-0006S7-67
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 11:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGQ6xlJTnP/AvQUSmG4PSN4mvOoY4FwrHxB9DyI4EHI=; b=ISGRWZnbDLPT50N1mgwQo7pdqf
 RzKyBrcbFiK0FLz91aqFqWgPbhCmLWxtH3LCHMtoGfPvKxxAwW+GvRZYHiydBjCa8di5mcp58/xzL
 Tlwv/m2rnr6zjA7axj6h6+eodrkNKJFqEhHDkh/O61+6cyot0P/1RjW8uZhoqxYZOQv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGQ6xlJTnP/AvQUSmG4PSN4mvOoY4FwrHxB9DyI4EHI=; b=l+DEQ2IUVjAMRBvJ4BegqY/ywi
 xSJUM4r429dJuRJsbDs/8MHmjor0xKUDlHGk0BWB3vZc9m1lUBLlIYu83AHkNo3TDRbd7FFCVtYN8
 c+qNpsiNMpEmICfczMVeh6MVBOkJzRKBvU4WGuRozzQov+0vBdjgERNFuBNBT+wc5s7c=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9MpG-00015G-9M for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 11:06:50 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 792C7176E4B; Fri,  8 Nov 2024 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1731063999; bh=dXaG98lanFee9CnyrJvud7M2t9VwUcMVMib88PxUrKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2LmiucyDnVgdTk1z3HmmXag2ZhApc0ZIxqwEF73RQlnqjobTlN+R1H5iNHJrx6b3
 wnBIOn5I6VecYN+WZbkW7QII5dk9B6zgpT7/X3P/aRSYQ1Wmi+JQacql8Q8P/NY+Br
 N0sJHOxVT70ZbBo2If9rdsp/664VQ+0emTZRZyZIrCNH9Nx/plFnI5YSeqOKsumLcl
 N5KE5cBXybQcmy/2zoai18KO0oJnaFFJhR86sdqjihSymjbjt4HZ+Tp1/vv7Ur6ion
 GVUAiZI2QOqu/Un8pzoQykIIkM0kj7bqnREcAA881c2mp2Wn0c323G7sQjLJZ3LYe0
 7/9E+xZi3VeJQ==
Date: Fri, 8 Nov 2024 11:06:39 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20241108110639.GA118048@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
 <173105511502.10030.8958584403113767756.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173105511502.10030.8958584403113767756.b4-ty@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 08, 2024 at 08:38:35AM +0000, Daniel Thompson
 wrote: > > On Mon, 28 Oct 2024 19:17:00 +0000, Nir Lichtman wrote: > > The
 simple_str* family of functions perform no error checking in > > sc [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t9MpG-00015G-9M
Subject: Re: [Kgdb-bugreport] [PATCH v4 0/3] Replace the use of
 simple_strtol/ul functions with kstrto
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
Cc: kgdb-bugreport@lists.sourceforge.net, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Nov 08, 2024 at 08:38:35AM +0000, Daniel Thompson wrote:
> 
> On Mon, 28 Oct 2024 19:17:00 +0000, Nir Lichtman wrote:
> > The simple_str* family of functions perform no error checking in
> > scenarios where the input value overflows the intended output variable.
> > This results in these function successfully returning even when the
> > output does not match the input string.
> > 
> > Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> > simple_strtoul(), and simple_strtoull() functions explicitly ignore
> > overflows, which may lead to unexpected results in callers."
> > Hence, the use of those functions is discouraged.
> > 
> > [...]
> 
> Applied, thanks!

Thanks!

Nir


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
