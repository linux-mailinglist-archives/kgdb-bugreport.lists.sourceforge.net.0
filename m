Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F7260584
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Sep 2020 22:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kFNcV-0003Qq-16
	for lists+kgdb-bugreport@lfdr.de; Mon, 07 Sep 2020 20:20:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dave@stgolabs.net>) id 1kFNcT-0003Qc-MP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 20:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YPVF8u2SoSPKVf8I9FNPhEqi98rexOWdjnAtz1AmXRs=; b=a0SsO3+k0o5becFqoRoDVNp9ON
 Yl7myrzKew0L/UZ0j8ywGmIj1okP+aSLmaYOEGB8TRMmeKjWZhjFLIN2ZezPuvxnyEejy1Ycf2WBU
 EVHkSq2nQT41gdggSk5OH44B9a/xvF1E4RqrudJ2ITDwuwPnFyL3EP6mwH+AUiEZhRB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YPVF8u2SoSPKVf8I9FNPhEqi98rexOWdjnAtz1AmXRs=; b=APQaLdz5sY+YBM3P0I6N9AnCMS
 dMLR3vT6iL5IKYGNX5rn1wZdcXqdQkGxPzC9ucd0TCy7qSJ90VGLjs9iNcCswveSR7uzDpk4jLvS2
 lzXOl0eb4ELQAButeEMPUhIJfZZT8XwwCe4YFxmCu4d1lNyQNfmdBnKYlEICQBqn/yTA=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFNcO-00Ft1e-G5
 for kgdb-bugreport@lists.sourceforge.net; Mon, 07 Sep 2020 20:20:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 989A9AB54;
 Mon,  7 Sep 2020 20:19:44 +0000 (UTC)
Date: Mon, 7 Sep 2020 13:03:22 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <20200907200322.shuexcour6kmegq6@linux-p48b>
References: <20200831193435.22141-1-dave@stgolabs.net>
 <20200907134614.guc4tzj3knnihbe4@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907134614.guc4tzj3knnihbe4@holly.lan>
User-Agent: NeoMutt/20180716
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFNcO-00Ft1e-G5
Subject: Re: [Kgdb-bugreport] [PATCH -next] kdb: Use newer api for tasklist
 scanning
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
Cc: Davidlohr Bueso <dbueso@suse.de>, kgdb-bugreport@lists.sourceforge.net,
 oleg@redhat.com, jason.wessel@windriver.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 07 Sep 2020, Daniel Thompson wrote:

>No objections to the change but kdb doesn't use tsk->thread_group,
>it uses do_each_thread/while_each_thread. Can we change this to
>say that is osbsolete and racy to use while_each_thread() (that's
>pretty much what the description of the patch that introduced
>for_each_thread said)?

Well while_each_thread() is just a loop around next_thread(),
which uses tsk->thread_group. But sure, I can rephrase a v2 to say
while_each_thread.

>
>Additionally the debug_core uses do_each_thread/while_each_thread.
>Presumably that would like to be changed as well?

Are you referring to gdb_cmd_query()? Yeah, that's another one that
can be replaced. Because we need not worry about races, it's rather
simple to justify both replacements in the same patch, which I'll
add to v2.

Thanks,
Davidlohr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
