Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9071326014
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Feb 2021 10:32:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lFZUA-00045c-5l
	for lists+kgdb-bugreport@lfdr.de; Fri, 26 Feb 2021 09:32:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lFZU9-00045V-BQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 09:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2j0v9/++oo1nREjYMkhdHiO+3+LGu2RSZ2BTupmAla4=; b=Hw5rjPnviQit0IOb7qYrJCo/vr
 ToFFTYm/njthdol4l7OnVGK1MrHjqb0e40vRmWHjQkXgcgERuynZAqunz5zIMovvz13Mk0MAmEgnp
 j9nVEywyJvq+rsChnsRIT9RLG/CzP7mdhunQAN1ZRnx5SEQ4AJG1Askh5Jf4vig3Wb5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2j0v9/++oo1nREjYMkhdHiO+3+LGu2RSZ2BTupmAla4=; b=f+h8iZVMu63vRXGP3hNnPz9rA4
 B5R9cXMYOfHq6UQs9EsDCJczBPM/FTp+v3Rd1BFLrKBfS5HbYoBdf7vtEdXm183p/YBHSP9SDXAzs
 w1D8iB9oG78emD2+hWDVMR7gvKbydQ50r35zkzo25zWTYJKo+3CLezqdvWta43Vi06tY=;
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lFZU4-0005FL-OD
 for kgdb-bugreport@lists.sourceforge.net; Fri, 26 Feb 2021 09:32:32 +0000
Received: by mail-lj1-f173.google.com with SMTP id a17so9872444ljq.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Feb 2021 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2j0v9/++oo1nREjYMkhdHiO+3+LGu2RSZ2BTupmAla4=;
 b=ophkVSbst+ACqsyZFIiOp79lI2xxUl3LTnFt38oEalw/lQhYiComoPd8ijpD3Cvs6b
 cFI7zSVaYrOq61d/V5+i1JkNmr12hiKpRSEHr8gR2wlCsNdpDrIPUUifibpC9lQQcpxE
 t9/zYhSgsN90TVSI7GkaQZAVAJv9gO6s0+VjYYrmiEKzpztvbp0MvHtOxsoGtakVk3Aw
 JF/9bzvQPT+ot3SJpxr7RlkFzvYbf8wW4FBT4L2IiWmOtvZ59g3SUWHN8yM/IHwbrAxc
 fJhbQ0mnqFDXqitVUA7ghcrSxSJSlVWsZrjdYYpLp9s/mZyFpo9kQ1CxIfR9f0b1yRFJ
 S2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2j0v9/++oo1nREjYMkhdHiO+3+LGu2RSZ2BTupmAla4=;
 b=LLRFrtQwdIG3FHv2tv38vonDoTIGvQtiBYEb0UDWIbLiVEgZ+Mu4BqVRFLJ6CPxvHC
 DE+TGih0Spgvxt8rhrnjJkeNgT1DptpEk2kKmKUf4Ks8i5dLNYRpiz9/qIgLHBPPQ3tL
 j2Y152Pqy2llSxXX7u5pb8oabRbML7q6t1lHLDhghaRhPL3a+pfOtzwJIWvFhjTHGL5G
 eDzAjsUZRgdxMmEFU3IIw+9QYsaEQ50QdJhgV4AkfT1zID9vn7jGeBF4d6o8/ynTbXsu
 36I/RnMCyWtIX0asTuXRVoDEz0PwMc/zxrhaFA+l4mduIplSdSp5OtQ+jSDudFSiZKsN
 aBlg==
X-Gm-Message-State: AOAM531gtFgb3eycyT1tXs9crzWg+DI+Ch+JfR3e13fZVlxOaP5nqyDH
 yzX/CjmfDQYGkW70OX5lSyGCqI+QJcPCaOBYve+Q2A==
X-Google-Smtp-Source: ABdhPJxLOkSkEiUl2P7/vAViwKIgnITzNFziDn2z3wSwQ8KotDtSrVgAn+bJD8uGHGxHDbB8+J8Yr1MI0QZIhnT3tPA=
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr1205089ljk.442.1614331941504; 
 Fri, 26 Feb 2021 01:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20210224081652.587785-1-sumit.garg@linaro.org>
 <20210225155607.634snzzq3w62kpkn@maple.lan>
 <CAFA6WYMYDNk2S=7crfYsrbP7XONTA-ytEypoqeo1GTpxf8NhAQ@mail.gmail.com>
 <YDij234n3KAxWuXf@kroah.com>
In-Reply-To: <YDij234n3KAxWuXf@kroah.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 26 Feb 2021 15:02:09 +0530
Message-ID: <CAFA6WYOij9-o35CVeZxi94+x8_cTpfXORmhn5YpfOgz0a-Ertg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFZU4-0005FL-OD
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix to kill breakpoints on
 initmem after boot
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 qy15sije@cip.cs.fau.de, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gRnJpLCAyNiBGZWIgMjAyMSBhdCAxMzowMSwgR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjYsIDIwMjEgYXQgMTI6MzI6MDdQTSAr
MDUzMCwgU3VtaXQgR2FyZyB3cm90ZToKPiA+ICsgc3RhYmxlIE1MCj4gPgo+ID4gT24gVGh1LCAy
NSBGZWIgMjAyMSBhdCAyMToyNiwgRGFuaWVsIFRob21wc29uCj4gPiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIEZlYiAyNCwgMjAyMSBhdCAw
MTo0Njo1MlBNICswNTMwLCBTdW1pdCBHYXJnIHdyb3RlOgo+ID4gPiA+IEN1cnJlbnRseSBicmVh
a3BvaW50cyBpbiBrZXJuZWwgLmluaXQudGV4dCBzZWN0aW9uIGFyZSBub3QgaGFuZGxlZAo+ID4g
PiA+IGNvcnJlY3RseSB3aGlsZSBhbGxvd2luZyB0byByZW1vdmUgdGhlbSBldmVuIGFmdGVyIGNv
cnJlc3BvbmRpbmcgcGFnZXMKPiA+ID4gPiBoYXZlIGJlZW4gZnJlZWQuCj4gPiA+ID4KPiA+ID4g
PiBGaXggaXQgdmlhIGtpbGxpbmcgLmluaXQudGV4dCBzZWN0aW9uIGJyZWFrcG9pbnRzIGp1c3Qg
cHJpb3IgdG8gaW5pdG1lbQo+ID4gPiA+IHBhZ2VzIGJlaW5nIGZyZWVkLgo+ID4gPiA+Cj4gPiA+
ID4gU3VnZ2VzdGVkLWJ5OiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+
ID4gPgo+ID4gPiBJIHNhdyBBbmRyZXcgaGFzIHBpY2tlZCB0aGlzIG9uZSB1cC4gVGhhdCdzIG9r
IGZvciBtZToKPiA+ID4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+Cj4gPiA+Cj4gPiA+IEkgYWxyZWFkeSBlbnJpY2hlZCBrZ2RidGVzdCB0byBj
b3ZlciB0aGlzIChhbmQgdGhleSBwYXNzKSBzbyBJIGd1ZXNzCj4gPiA+IHRoaXMgaXMgYWxzbzoK
PiA+ID4gVGVzdGVkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8u
b3JnPgo+ID4gPgo+ID4KPiA+IFRoYW5rcyBEYW5pZWwuCj4gPgo+ID4gPiBCVFcgdGhpcyBpcyBu
b3QgQ2M6ZWQgdG8gc3RhYmxlIGFuZCBJIGRvIHdvbmRlciBpZiBpdCBjcm9zc2VzIHRoZQo+ID4g
PiB0aHJlc2hvbGQgdG8gYmUgY29uc2lkZXJlZCBhIGZpeCByYXRoZXIgdGhhbiBhIGZlYXR1cmUu
IE5vcm1hbGx5IEkKPiA+ID4gY29uc2lkZXIgYWRkaW5nIHNhZmV0eSByYWlscyBmb3Iga2dkYiB0
byBiZSBhIG5ldyBmZWF0dXJlIGJ1dCwgaW4gdGhpcwo+ID4gPiBjYXNlLCB0aGUgcHJvYmxlbSB3
b3VsZCBlYXNpbHkgZW5zbmFyZSBhbiBpbmV4cGVyaWVuY2VkIGRldmVsb3BlciB3aG8gaXMKPiA+
ID4gZG9pbmcgbm90aGluZyBtb3JlIHRoYW4gZGVidWdnaW5nIHRoZWlyIG93biBkcml2ZXIgKGFz
c3VtaW5nIHRoZXkKPiA+ID4gY29ycmVjdGx5IG1hcmtlZCB0aGVpciBwcm9iZSBmdW5jdGlvbiBh
cyAuaW5pdCkgc28gSSB0aGluayB0aGlzIHdlaWdocwo+ID4gPiBpbiBmYXZvdXIgb2YgYmVpbmcg
YSBmaXguCj4gPiA+Cj4gPgo+ID4gTWFrZXMgc2Vuc2UsIENjOmVkIHN0YWJsZS4KPgo+Cj4gPGZv
cm1sZXR0ZXI+Cj4KPiBUaGlzIGlzIG5vdCB0aGUgY29ycmVjdCB3YXkgdG8gc3VibWl0IHBhdGNo
ZXMgZm9yIGluY2x1c2lvbiBpbiB0aGUKPiBzdGFibGUga2VybmVsIHRyZWUuICBQbGVhc2UgcmVh
ZDoKPiAgICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9z
dGFibGUta2VybmVsLXJ1bGVzLmh0bWwKPiBmb3IgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuCj4K
PiA8L2Zvcm1sZXR0ZXI+CgpUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBsZXQgbWUgd2FpdCBmb3Ig
dGhpcyBwYXRjaCB0byBsYW5kIGluIExpbnVz4oCZCnRyZWUgYW5kIHRoZW4gd2lsbCBkcm9wIGEg
bWFpbCB0byBzdGFibGVAdmdlci5rZXJuZWwub3JnLgoKLVN1bWl0CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
