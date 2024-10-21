Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B59B2F00
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2Y-0007dM-0o
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t2y8k-0002fw-MZ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 19:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQ42qSgPqN2BzDinrVgIpIX1EKJo8qAiwqlENos+Cw0=; b=JOfmHSt1GE0R0Q7I18U4ALMR3U
 vMDAQzFzaaFDLWU9BHqQV5EjkK3hbP8iDcWoASrS7jxvR5oYY/Um+Y0kFizdEX7HDkHqBe2W3SLH0
 A7sk9xweUohycyWTSWYQB6VGbTRP9OhkVMB9MXefQQAocQ65lZDIbqEd9iYHW3u0FLro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zQ42qSgPqN2BzDinrVgIpIX1EKJo8qAiwqlENos+Cw0=; b=DBZ6HrLa0oVPgOnPglQ22Oj8WD
 +zJWoTcheV5Kh4PwPPTPiVgC6pbr4zInManGXNDtt0CsNKteJz2SIfgbiOT6LoN2UgaQUasjYEQok
 aALQXZudEX+15uSGGFke0O4aYsU7v9nasBGzXc0SRBxIzg7eki3WqckvP5JZKoORM4co=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2y8j-00019j-Ec for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 19:32:30 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id BCC6D177106; Mon, 21 Oct 2024 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729539143; bh=lvbUhXDFjOdI5unZDc8utq3G1xeo/THENAURmkXLtAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ayevwYMRcN7dicEdONEvabO2FibzrRiry7l5ZKbLeqdEgM8C8FaRZoTMQVuPKL/7I
 Et2VA8ljzNLKY9zPdDYbbxvHuD+lIwdl6VPDDDUOIc0Vy/qMQKWzNLBlLQIU+o+R2p
 Ui+iR14IjhPFSVqK/T5jYQwr94mQkpEAtlg0OtsARJ/hVi/8OeArLGdJy79OTDrjug
 Nc3xHcIuUBcocj0T4z/yRBFvRmOrIPcszGXMf2RftseF0iS3mzW1wfM1ZFYAE4aE0O
 xea9b72iRodg9saIxHHB6StUI2eehfJbzhVw9GoMG6GZgm/uLFj8uBxiCYTPKUxeQD
 Rc99NetmJWMPQ==
Date: Mon, 21 Oct 2024 19:32:23 +0000
From: Nir Lichtman <nir@lichtman.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20241021193223.GA834839@lichtman.org>
References: <20241019195715.GA810861@lichtman.org>
 <20241019204212.GA811391@lichtman.org>
 <CAD=FV=UpKjTe78vexUXFThPXtx1KjhfR_u+1hpQpkh8ei-F5aA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UpKjTe78vexUXFThPXtx1KjhfR_u+1hpQpkh8ei-F5aA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Oct 21, 2024 at 10:14:15AM -0700, Doug Anderson wrote:
    > Hi, > > On Sat, Oct 19, 2024 at 1:42 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > > > Problem: In many cases, KDB treats invalid com [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t2y8j-00019j-Ec
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:55 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2] KDB: Fix incorrect treatment of
 numbers in the CLI
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
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 Yuran Pereira <yuran.pereira@hotmail.com>, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgMTA6MTQ6MTVBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBTYXQsIE9jdCAxOSwgMjAyNCBhdCAxOjQy4oCvUE0gTmlyIExp
Y2h0bWFuIDxuaXJAbGljaHRtYW4ub3JnPiB3cm90ZToKPiA+Cj4gPiBQcm9ibGVtOiBJbiBtYW55
IGNhc2VzLCBLREIgdHJlYXRzIGludmFsaWQgY29tbWFuZHMgYXMgbnVtYmVycyBhbmQKPiA+IGlu
c3RlYWQgb2YgcHJpbnRpbmcgYSB1c2FnZSBlcnJvciwgZ29lcyBhaGVhZCBhbmQganVzdCBwcmlu
dHMgdGhlIG51bWJlcgo+ID4gaW4gaGV4Cj4gPgo+ID4gRXhhbXBsZTogVGhpcyBjYW4gYmUgZGVt
b25zdHJhdGVkIHdoZW4gdHlwaW5nIGZvciBleGFtcGxlICJhYWF6enoiLCB0aGlzCj4gPiBjb25m
dXNlcyBLREIgaW50byB0aGlua2luZyB0aGlzIGlzIHRoZSBoZXhhZGVjaW1hbCAweEFBQQo+ID4K
PiA+IFNvbHV0aW9uOiBUcmFuc2l0aW9uIHRvIHVzaW5nIGtzdHJ0b3VsIGluc3RlYWQgb2Ygc2lt
cGxlX3N0cnRvdWwuCj4gPiBUaGlzIGZ1bmN0aW9uIGlzIG1vcmUgc3RyaWN0IHdpdGggd2hhdCBp
dCB0cmVhdHMgYXMgYSBudW1iZXIKPiA+IGFuZCB0aHVzIHNvbHZlcyB0aGUgaXNzdWUuCj4gPiAo
YWxzbyBiZXR0ZXIgcHJhY3RpY2UgYXMgc3RhdGVkIGluIHRoZSBkZWZpbml0aW9uIG9mIHNpbXBs
ZV9zdHJ0b3VsKS4KPiA+Cj4gPiB2MjogUmVtb3ZlZCByZWR1bmRhbnQgaWYgY29uZGl0aW9uIEkg
cHV0IGluIHYxCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmlyIExpY2h0bWFuIDxuaXJAbGljaHRt
YW4ub3JnPgo+ID4gLS0tCj4gPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIHwgNyArKy0t
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIva2VybmVs
L2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gPiBpbmRleCBmNWY3ZDdmYjU5MzYuLjRjYmQ1Y2QyNjgy
MSAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+ID4gKysrIGIv
a2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gPiBAQCAtNDAyLDE4ICs0MDIsMTUgQEAgc3Rh
dGljIHZvaWQga2RiX3ByaW50ZW52KHZvaWQpCj4gPiAgICovCj4gPiAgaW50IGtkYmdldHVsYXJn
KGNvbnN0IGNoYXIgKmFyZywgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gPiAgewo+ID4gLSAgICAg
ICBjaGFyICplbmRwOwo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIHZhbDsKPiA+Cj4gPiAtICAg
ICAgIHZhbCA9IHNpbXBsZV9zdHJ0b3VsKGFyZywgJmVuZHAsIDApOwo+ID4KPiA+IC0gICAgICAg
aWYgKGVuZHAgPT0gYXJnKSB7Cj4gPiArICAgICAgIGlmIChrc3RydG91bChhcmcsIDAsICZ2YWwp
ICE9IDApIHsKPiA+ICAgICAgICAgICAgICAgICAvKgo+ID4gICAgICAgICAgICAgICAgICAqIEFs
c28gdHJ5IGJhc2UgMTYsIGZvciB1cyBmb2xrcyB0b28gbGF6eSB0byB0eXBlIHRoZQo+ID4gICAg
ICAgICAgICAgICAgICAqIGxlYWRpbmcgMHguLi4KPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+
IC0gICAgICAgICAgICAgICB2YWwgPSBzaW1wbGVfc3RydG91bChhcmcsICZlbmRwLCAxNik7Cj4g
PiAtICAgICAgICAgICAgICAgaWYgKGVuZHAgPT0gYXJnKQo+ID4gKyAgICAgICAgICAgICAgIGlm
IChrc3RydG91bChhcmcsIDE2LCAmdmFsKSAhPSAwKQo+IAo+IEluc3RlYWQgb2YganVzdCBmaXhp
bmcgdGhlIG9uZSBjYXNlLCBkbyB5b3Ugd2FudCB0byBqdXN0IHRha2Ugb3ZlciB0aGUKPiBvbGQg
cGF0Y2ggc2VyaWVzIHRoYXQgdHJpZWQgdG8gZG8gYSBtb3JlIGNvbXBsZXRlIGpvYjoKPiAKPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yL0dWMVBSMTBNQjY1NjNFMEY4REIyRDMzNUJEOUNGRTRE
M0U4QjRBQEdWMVBSMTBNQjY1NjMuRVVSUFJEMTAuUFJPRC5PVVRMT09LLkNPTS8KPiAKPiBJIHRo
aW5rIGluIGdlbmVyYWwgdGhhdCBzZXJpZXMgbG9va2VkIGdvb2QgYnV0IGp1c3QgaGFkIGEgZmV3
IG5pdHMgb24KPiBpdCwgYnV0IHRoZSBhdXRob3IgKFl1cmFuIFBlcmVpcmEpIG5ldmVyIGZvbGxv
d2VkIHVwIHdpdGggYSB2Mi4gWW91Cj4gY291bGQgdGFrZSB0aGF0IHNlcmllcywgZml4IHRoZSBu
aXRzLCBhZGQgeW91ciBzaWduZWQtb2ZmLWJ5LCBhbmQgcG9zdAo+IGEgdjI/Cj4gCj4gLURvdWcK
CkludGVyZXN0aW5nLCB3aWxsIHRha2UgYSBsb29rLgoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
