Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63534BC59
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 28 Mar 2021 14:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lQUic-00089f-NK
	for lists+kgdb-bugreport@lfdr.de; Sun, 28 Mar 2021 12:40:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lQUib-00089Y-MG
 for kgdb-bugreport@lists.sourceforge.net; Sun, 28 Mar 2021 12:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIfUfLS8WEjaD/bWCh93RNaDbRJK0LPFReTxH9coSJQ=; b=kix5PxUt6/4SoZDaSBjw2xuGuL
 W10RlXsm3NI0utcNONLAv/fWsnNLhG1bEiqbyTeLLvT/3X+o7Pvl5JoGx0BJiSWRch2EKhigrEQxa
 DI99AX2jJnwGpnBSjZ9iccsjXAPTPGN+pLj8NLvSI6Sys+xHwCRR/5IsUfWwZCFQwkJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wIfUfLS8WEjaD/bWCh93RNaDbRJK0LPFReTxH9coSJQ=; b=c3JFieJbP9zGCXAeHDlSJhVPum
 ioaVwO4Pdf2zxRPfQky/HTY1EtDHU/X8EPWWcJ6tR1Jfd+9RmonV/97wxScFTXIUiTEZdX/AEcgsz
 4L/v+WnWdZpi9xVp92odRzb3Vtlqq+3/bDtADY9MP8Q6oHoGl+mAwhg0qEGO5MehEGro=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lQUiJ-0004Qn-1l
 for kgdb-bugreport@lists.sourceforge.net; Sun, 28 Mar 2021 12:40:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A217600EF;
 Sun, 28 Mar 2021 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616935205;
 bh=eu5d97hSMAWimAQeOp1i4JVeqM3czhuZjG/u5FMBSbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PqzFwpXWBsAshmGZg+OLXCEg2MqP1e9r33/GkjOzYfBHKg4OnWyotM9iFHVbHmzAM
 btPzRhVyq5ZK5MzJccv4E1xy6gDFcP4Ucr4zZdLd09acmjcENw/SKjs9+bLdIpuikS
 Az5aFkVoQtS53R6pNWNozfZXF5KTO/Fh/T/ze/eE=
Date: Sun, 28 Mar 2021 14:40:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <YGB5IlM7/WqSOdQ2@kroah.com>
References: <20210325094807.3546702-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325094807.3546702-1-daniel.thompson@linaro.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lQUiJ-0004Qn-1l
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: Switch to do_sys_openat2() for
 breakpoint testing
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
 Arnd Bergmann <arnd@arndb.de>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Mar 25, 2021 at 09:48:07AM +0000, Daniel Thompson wrote:
> Currently kgdbts can get stuck waiting for do_sys_open() to be called
> in some of the current tests. This is because C compilers often
> automatically inline this function, which is a very thin wrapper around
> do_sys_openat2(), into some of its callers. gcc-10 does this on (at least)
> both x86 and arm64.
> 
> We can fix the test suite by placing the breakpoints on do_sys_openat2()
> instead since that isn't (currently) inlined. However do_sys_openat2() is
> a static function so we cannot simply use an addressof. Since we are
> testing debug machinery it is acceptable to use kallsyms to lookup a
> suitable address because this is more or less what kdb does in the same
> circumstances. Re-implement lookup_addr() to be based on kallsyms rather
> than function pointers.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> 
> Notes:
>     So less than a week ago I said I had nothing pending for kgdbts.
>     That was entirely true when I said it... but then this came up.

No worries, I'll take this too :)

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
